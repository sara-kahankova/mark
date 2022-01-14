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
  rental = Rental.create(
    title: Faker::Book.title,
    address: Faker::Address.street_address,
    description: Faker::Quote.famous_last_words,
    price: rand(5000..50000),
    size: "#{rand(1..5)} + kk",
    city: Faker::Address.city
  )

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
