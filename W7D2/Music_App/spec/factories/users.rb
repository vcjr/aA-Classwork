FactoryBot.define do
    factory :user do
        email { Faker::Internet.email }
        password { "starwars" }
    end
end