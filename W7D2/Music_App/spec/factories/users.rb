FactoryBot.define do
    factory :user do
        email Faker::Internet.email
        session_token SecureRandom.urlsafe_base64
        password "starwars"
    end
end