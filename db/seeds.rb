require 'faker'

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning Database"

Comment.destroy_all
Post.destroy_all
User.destroy_all

puts "Creating users and their posts"

10.times do
  User.create(
    email: Faker::Internet.email,
    password: "123456",

    name: Faker::Name.name,
    bio: Faker::Quote.yoda,
    birthday: Faker::Date.between(from: '1900-01-1', to: '2004-12-31')
  )

  puts "#{User.last.name} has been created"
end

puts "#{User.count} have been created"
