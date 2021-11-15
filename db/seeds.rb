# Bookmark.destroy_all
# Movie.destroy_all
# List.destroy_all

# images = ['https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg', "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg"]

# puts 'Creating movies...'

# 30.times do
#   Movie.create(title: Faker::Movie.title, overview: Faker::Quotes::Shakespeare.hamlet_quote, poster_url: images.sample, rating: rand(0..10.0).round(1))
# end

# puts "Created #{Movie.count} movies"
# puts 'Creating lists...'

# categories = ['horror', 'fun', 'thriller', 'weekend', 'historic']

# categories.each do |cat|
#   List.create(name: cat)
# end

# puts "Created #{List.count} lists"
# puts "Creating bookmarks"

# 10.times do
#   Bookmark.create(comment: Faker::Quote.famous_last_words, movie_id: Movie.all.sample.id, list_id: List.all.sample.id)
# end

# puts "Created #{Bookmark.count} bookmarks"


# ------------------------------------------------------------------------------
# Testing seeding with TMDB API

# Bookmark.destroy_all
# Movie.destroy_all
# List.destroy_all

# url = "http://tmdb.lewagon.com/movie/top_rated"
# 30.times do
#   movie = JSON.parse(open("#{url}?page=#{rand(1..400)}").read)['results'].sample
#   base_poster_url = "https://image.tmdb.org/t/p/original"
#   Movie.create(
#     title: movie['title'],
#     overview: movie['overview'],
#     poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
#     rating: movie['vote_average']
#   )
# end
# puts "#{Movie.count} movies created"

# categories = ['horror', 'fun', 'thriller', 'weekend', 'historic']

# categories.each do |cat|
#   List.create(name: cat)
# end

# puts "Created #{List.count} lists"

# 10.times do
#   Bookmark.create(comment: Faker::Quote.famous_last_words, movie_id: Movie.all.sample.id, list_id: List.all.sample.id)
# end

# puts "Created #{Bookmark.count} bookmarks"

# ------------------------------------------------------------------------------
# Adding all the movies from the TMDB API

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
User.destroy_all

puts "Creating Initial User if doesn't exist"

initial_user = User.create(email: "bob@gmail.com", password: '123456', username: 'OGsoundFX')

puts "#{initial_user.username} is present in Database"

url = "http://tmdb.lewagon.com/movie/top_rated"
base_poster_url = "https://image.tmdb.org/t/p/original"
number_of_files = JSON.parse(open(url).read)['total_pages']


JSON.parse(open(url).read)['results'].each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
    rating: movie['vote_average']
  )
end

n = 2
(number_of_files.to_i - 1).times do
  JSON.parse(open("#{url}?page=#{n}").read)['results'].each do |movie|
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
      rating: movie['vote_average']
    )
  end
  n += 1
end

puts "#{Movie.count} have been created"

categories = ['horror', 'fun', 'thriller', 'weekend', 'historic']

categories.each do |cat|
  List.create(name: cat, user_id: initial_user.id)
end

puts "Created #{List.count} lists"

10.times do
  Bookmark.create(comment: Faker::Quote.famous_last_words, movie_id: Movie.all.sample.id, list_id: List.all.sample.id)
end

puts "Created #{Bookmark.count} bookmarks"