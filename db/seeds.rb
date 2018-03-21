# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Tag.create!(name: 'Online Course')
Tag.create!(name: 'Event')
Tag.create!(name: 'Conference')
Tag.create!(name: 'Social Media Marketing')
Tag.create!(name: 'Social Media')

Category.create!(name: 'Business')
Category.create!(name: 'Technology')
Category.create!(name: 'Marketing')

8.times do
  organization = Organization.create!(name: Faker::Company.name, website: Faker::Internet.url('example.com'),
    instagram: Faker::Internet.domain_name,  description: Faker::Company.catch_phrase)
  category = Category.all.sample
  organization.categories << category
  offering = organization.offerings.create!(name: Faker::Job.field, price: Faker::Commerce.price,
    website: Faker::Internet.url('example.com'), description: Faker::Company.catch_phrase)
  tag = Tag.all.sample
  offering.tags << tag
end
