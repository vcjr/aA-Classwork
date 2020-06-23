# == Schema Information
#
# Table name: users
#
#  id             :bigint           not null, primary key
#  email          :string           not null
#  password_diget :string           not null
#  session_token  :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    
    after_initialize :ensure_session_token
    # This will generate a random session token using the SecureRandom &
    # urlsafe_base64 method 
    # I can goto the rails console and ls the SecureRandom to get list of methods
    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    # Query the User table to find the user by email. Then we check to make sure 
    #the user is found and that the password entered matches with the password digest
    def self.find_by_credentials(email, password)
        user = User.find_by(email: email)
        return nil unless user && user.is_password?(password)
        user
    end

    # We will use this method to reset the session token inside of our databse. 
    # We start by generating a new token then  we will find a user by the cookie 
    #session token and reset their session token to the new generated token
    def reset_session_token!
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    private

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end


end
