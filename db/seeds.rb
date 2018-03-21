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

Organization.create!(
  name: Faker::Company.name,
  website: Faker::Internet.url('example.com'),
  twitter: Faker::Internet.domain_name,
  instagram: Faker::Internet.domain_name,
  facebook: Faker::Internet.domain_name,
  description: Faker::Company.catch_phrase,
  avatar: File.open(Rails.root.join('app/assets/images/seeds-company1.jpg')),
  history: Faker::Hipster.sentence(4)
)
Organization.create!(
  name: Faker::Company.name,
  website: Faker::Internet.url('example.com'),
  twitter: Faker::Internet.domain_name,
  instagram: Faker::Internet.domain_name,
  facebook: Faker::Internet.domain_name,
  description: Faker::Company.catch_phrase,
  avatar: File.open(Rails.root.join('app/assets/images/seeds-company2.jpg')),
  history: Faker::Hipster.sentence(4)
)
Organization.create!(
  name: Faker::Company.name,
  website: Faker::Internet.url('example.com'),
  twitter: Faker::Internet.domain_name,
  instagram: Faker::Internet.domain_name,
  facebook: Faker::Internet.domain_name,
  description: Faker::Company.catch_phrase,
  avatar: File.open(Rails.root.join('app/assets/images/seeds-company3.jpg')),
  history: Faker::Hipster.sentence(4)
)
Organization.create!(
  name: Faker::Company.name,
  website: Faker::Internet.url('example.com'),
  twitter: Faker::Internet.domain_name,
  instagram: Faker::Internet.domain_name,
  facebook: Faker::Internet.domain_name,
  description: Faker::Company.catch_phrase,
  avatar: File.open(Rails.root.join('app/assets/images/seeds-company4.jpg')),
  history: Faker::Hipster.sentence(4)
)
Organization.create!(
  name: Faker::Company.name,
  website: Faker::Internet.url('example.com'),
  twitter: Faker::Internet.domain_name,
  instagram: Faker::Internet.domain_name,
  facebook: Faker::Internet.domain_name,
  description: Faker::Company.catch_phrase,
  avatar: File.open(Rails.root.join('app/assets/images/seeds-company4.jpg')),
  history: Faker::Hipster.sentence(4)
)
Organization.create!(
  name: Faker::Company.name,
  website: Faker::Internet.url('example.com'),
  twitter: Faker::Internet.domain_name,
  instagram: Faker::Internet.domain_name,
  facebook: Faker::Internet.domain_name,
  description: Faker::Company.catch_phrase,
  avatar: File.open(Rails.root.join('app/assets/images/seeds-company6.jpg')),
  history: Faker::Hipster.sentence(4)
)
Organization.create!(
  name: Faker::Company.name,
  website: Faker::Internet.url('example.com'),
  twitter: Faker::Internet.domain_name,
  instagram: Faker::Internet.domain_name,
  facebook: Faker::Internet.domain_name,
  description: Faker::Company.catch_phrase,
  avatar: File.open(Rails.root.join('app/assets/images/seeds-company7.jpg')),
  history: Faker::Hipster.sentence(4)
)
Organization.create!(
  name: Faker::Company.name,
  website: Faker::Internet.url('example.com'),
  twitter: Faker::Internet.domain_name,
  instagram: Faker::Internet.domain_name,
  facebook: Faker::Internet.domain_name,
  description: Faker::Company.catch_phrase,
  avatar: File.open(Rails.root.join('app/assets/images/seeds-company8.jpg')),
  history: Faker::Hipster.sentence(4)
)

Organization.all.each do |organization|
  category = Category.all.sample
  organization.categories << category
  number = [*1..10]
  offering = organization.offerings.create!(
    name: Faker::Hipster.sentence(3),
    price: Faker::Commerce.price,
    website: Faker::Internet.url('example.com'),
    description: Faker::Company.catch_phrase,
    format: Tag.all[0..2].sample.name,
    location: Faker::Address.city,
    date: Faker::Time.forward(20, :morning),
    payment_options: "#{Faker::Commerce.promotion_code};#{Faker::Commerce.promotion_code}",
    materials:  "#{Faker::Movie.quote}; #{Faker::Movie.quote};",
    length: "#{number.sample} Days"
  )
  tag = Tag.all.sample
  offering.tags << tag
end
