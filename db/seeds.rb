# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "generating bands"
100.times do
  name = "#{Faker::Hacker.adjective} #{Faker::Space.galaxy} #{Faker::Hacker.noun}".titleize
  Band.create!(name: name)
end
puts "generated #{Band.all.length} bands"

puts "generating albums and tracks"
400.times do |i|
  band = Random.new.rand(0..Band.all.length)
  name = "#{Faker::Pokemon.location} #{Faker::StarWars.specie}"
  year = Random.new.rand(1920..2016)
  live = [true, false].sample
  Album.create!(band_id: band, name: name, year: year, live: live)
  Random.new.rand(5..16).times do
    name = "#{Faker::StarWars.planet} #{Faker::Superhero.power}"
    bonus = [true, false, false, false, false, false].sample
    lyrics = Faker::Hipster.paragraph(3)
    Track.create!(album_id: i + 1, name: name, bonus: bonus, lyrics: lyrics)
  end
end

puts "generated #{Album.all.length} albums and #{Track.all.length} tracks"
