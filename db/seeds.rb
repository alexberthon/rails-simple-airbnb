# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Clearing database..."
Flat.destroy_all
puts "Database cleared"

flat_types = %w[flat apartment building house shed cabin villa]
search_terms = %w[flat apartment building house shed cabin villa city town village cottage estate]

10.times do
  new_flat = Flat.create!(
    name: "#{Faker::Commerce.material} #{flat_types.sample} in #{Faker::Address.city}",
    address: Faker::Address.full_address,
    latitude: Faker::Address.latitude.to_f,
    longitude: Faker::Address.longitude.to_f,
    description: Faker::Lorem.paragraphs(number: 3).join,
    price_per_night: (rand * 100).ceil,
    number_of_guests: (1..10).to_a.sample,
    picture_url: Faker::LoremFlickr.image(size: "1200x500", search_terms: [search_terms.sample])
  )
  puts "#{new_flat.name} created"
end

puts "#{Flat.count} flats added to the database"
