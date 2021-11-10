# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

images = ['https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg', "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg"]

puts 'Creating movies...'

30.times do
  Movie.create(title: Faker::Movie.title, overview: Faker::Quotes::Shakespeare.hamlet_quote, poster_url: images.sample, rating: rand(0..10.0).round(1))
end

puts "Created #{Movie.count} movies"
puts 'Creating lists...'

categories = ['horror', 'fun', 'thriller', 'weekend', 'historic']

categories.each do |cat|
  List.create(name: cat)
end

puts "Created #{List.count} lists"
puts "Creating bookmarks"

10.times do
  Bookmark.create(comment: Faker::Quote.famous_last_words, movie_id: Movie.all.sample.id, list_id: List.all.sample.id)
end

puts "Created #{Bookmark.count} bookmarks"