# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
louis = User.create!(email: "Louisstephancruz@me.com", password: "testtest")
other = User.create!(email: "lsc@juilliard.edu", password: "testtest")

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
    lyrics = []
    Random.new.rand(1..20).times do
      length = Random.new.rand(4..7)
      lyrics << Faker::Hipster.sentence(length)
    end
    lyrics = lyrics.join("\n")
    Track.create!(album_id: i + 1, name: name, bonus: bonus, lyrics: lyrics)
  end
  4.times do
    random_track = Track.offset(rand(Track.count)).first
    note_body = Faker::Hacker.say_something_smart
    Note.create!(body: note_body, user_id: louis.id, track_id: random_track.id)
  end
  4.times do
    random_track = Track.offset(rand(Track.count)).first
    note_body = Faker::Hacker.say_something_smart
    Note.create!(body: note_body, user_id: other.id, track_id: random_track.id)
  end
end

puts "generated #{Album.count} albums, #{Track.count} tracks, and #{Note.count} notes"

puts "generating tags"

40.times do
  word = Faker::Hipster.word
  taggable_type = ["Band", "Track", "Album"].sample
  id = taggable_type.constantize.all.sample.id
  Tag.create!(body: word, taggable_type: taggable_type, taggable_id: id)
end

puts "generated #{Tag.count} tags and applied them to #{Tag.count} objects"
