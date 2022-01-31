# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning database..."
Post.destroy_all
Package.destroy_all
Review.destroy_all
Rental.destroy_all

puts "Creating posts..."

3.times do
  post = Post.create(
    title: Faker::Book.title,
    content: Faker::Quote.famous_last_words
  )

  puts "Created #{post.id}..."
end

puts "Creating rentals..."

5.times do
  rental = Rental.new(
    title: Faker::Book.title,
    address: Faker::Address.street_address,
    description: Faker::Quote.famous_last_words,
    price: rand(5000..50000),
    size: "#{rand(1..5)} + kk",
    city: Faker::Address.city
  )
  image_url = "https://images.unsplash.com/photo-1551806235-a05dd14a54c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1771&q=80"
  downloaded_image = URI.open(image_url)
  rental.photo.attach(io: downloaded_image, filename: "rental-#{rental.id}")
  rental.save

  puts "Created #{rental.id} rentals..."
end

puts "Creating packages..."

3.times do
  package = Package.create(
    name: Faker::Book.title,
    description: Faker::Quote.famous_last_words,
    price: rand(1000..15_000)
  )
  puts "Created #{package.id}..."
end

puts "Creating references..."

5.times do
  review = Review.new(
    content: Faker::Quote.famous_last_words,
    name: Faker::Name.name
  )
  review.package = Package.all.sample
  review.save

  puts "Created #{review.id} reviews..."

end
