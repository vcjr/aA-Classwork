# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.delete_all



smeagle = Band.create!(name: "Smeagles Counldren")
beagle = Band.create!(name: "Fires of Night")
retilian = Band.create!(name: "Reptilian Zombies")