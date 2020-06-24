require 'rails_helper'

RSpec.describe User, type: :model do
  # What to test?
  #   Validations
  #   Associations
  #   Class Methods
  #   Error Messages

    describe 'validations' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:session_token) }

      it do
         should validate_length_of(:password).
          is_at_least(7).
          on(:create)  
      end

      # it { should validate_uniqueness_of(:email) }
      # it { should validate_uniqueness_of(:session_token) }
    end

    describe 'Class Methods' do
      describe '::find_by_credentials' do
        it 'should return user based on credentials'
        it 'should return nil if credentials do not match database'
      end

      describe '#is_password?' do
        it 'should take in a plain-text password'
        it 'should true if password matches the BCrypt password'
        it 'should false if password does no match the BCrypt password'
      end

      describe '#reset_session_token' do
      end

    end
end


# it { should validate_presence_of(:email) }
