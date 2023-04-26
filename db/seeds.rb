# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

categories = %w[chinese italian japanese french belgian]

10.times do
  Restaurant.create(name: Faker::Restaurant.name, address: Faker::Address.street_address,
                    phone_number: Faker::Number.leading_zero_number(digits: 10), category: categories.sample)
end

number_restaurants = Restaurant.all.length

30.times do
  restaurant_sample_id = (1..number_restaurants).to_a.sample
  Review.create(content: Faker::Restaurant.review, rating: (0..5).to_a.sample,
                restaurant: Restaurant.find(restaurant_sample_id))
end
