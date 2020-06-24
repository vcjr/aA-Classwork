require 'rails_helper'
require 'spec_helper'
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
    end
    describe 'uniqueness' do
      before :each do
        create(:user) 
      end
      it { should validate_uniqueness_of(:email) }
      it { should validate_uniqueness_of(:session_token) }
    end

    describe 'Class Methods' do
      describe '::find_by_credentials' do
        it 'should return user based on credentials'
        it 'should return nil if credentials do not match database'
      end

      describe '#is_password?' do
        let!(:user) { create(:user) }
        context "with a valid password" do
          it 'should return true' do
            expect(user.is_password?('starwars')).to be(true)
          end
        end

        context "with an invalid password" do
          it 'should return false' do
            expect(user.is_password?('stawsdaad')).to be(false)
          end
        end
        it 'should take in a plain-text password'
      end

      describe '#reset_session_token' do
      end

    end
end


# it { should validate_presence_of(:email) }
