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
    validates :password, length: {minimum: 7}, allow_nil: true
    
    after_initialize :ensure_session_token

    attr_reader :password
    # This will generate a random session token using the SecureRandom &
    # urlsafe_base64 method 
    # I can goto the rails console and ls the SecureRandom to get list of methods
    

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

    # This will create our @password variable and also create and set our 
    # password digest for the user using the password and BCrypt
    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    # This method is going to receive a password all we do is run the BCrypt built
    # in method is_password on this.
    # First we obtain the password_digest of the user. Then we go and turn that
    # string into a BCrypt password object that we can run the command to check
    # if the password given is the same as the encrypted version  
    def is_password?(password)
        pass_digest = self.password_digest
        BCrypt::Password.new(pass_digest).is_password?(password)
    end

    private

    # This is going to make sure that the user has an active session token
    # If the user doesnt have one it will generate a new one and give it to him
    # this is after we initialize a new user we used the `after_initialize` helper
    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

end
