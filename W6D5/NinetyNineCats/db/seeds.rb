# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Cat.delete_all
COLORS = [
        "Black",
        "White",
        "Orange",
        "Purple"
    ]

cat_1 = Cat.create!(
    name: Faker::Creature::Cat.name,
    color: COLORS.sample,
    sex: "M",
    description: Faker::Quote.yoda,
    birth_date: Faker::Date.birthday(min_age: 1, max_age: 8)
)
cat_2 = Cat.create!(
    name: Faker::Creature::Cat.name,
    color: COLORS.sample,
    sex: "F",
    description: Faker::Quote.famous_last_words,
    birth_date: Faker::Date.birthday(min_age: 1, max_age: 8)
)
cat_3 = Cat.create!(
    name: Faker::Creature::Cat.name,
    color: COLORS.sample,
    sex: "M",
    description: Faker::Quote.most_interesting_man_in_the_world,
    birth_date: Faker::Date.birthday(min_age: 1, max_age: 8)
)
cat_4 = Cat.create!(
    name: Faker::Creature::Cat.name,
    color: COLORS.sample,
    sex: "F",
    description: Faker::Quote.matz,
    birth_date: Faker::Date.birthday(min_age: 1, max_age: 8)
)
cat_5 = Cat.create!(
    name: Faker::Creature::Cat.name,
    color: COLORS.sample,
    sex: "M",
    description: Faker::Quote.yoda,
    birth_date: Faker::Date.birthday(min_age: 1, max_age: 8)
)