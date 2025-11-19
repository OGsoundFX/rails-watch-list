# Adding all the movies from the TMDB API
require "open-uri"
require "json"

Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
User.destroy_all

puts "Creating Initial User if doesn't exist"

initial_user = User.create(email: "bob@gmail.com", password: '123456', username: 'OGsoundFX')

puts "#{initial_user.username} is present in Database"

api_key = ENV["TMDB_API_KEY"]
url = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{api_key}"
base_poster_url = "https://image.tmdb.org/t/p/original"
response = URI.open(url).read
number_of_files = JSON.parse(response)["total_pages"]

# Creating all the movies
n = 1
500.times do
  JSON.parse(URI.open("#{url}&page=#{n}").read)['results'].each do |movie|
    Movie.create(
      title: movie['title'],
      overview: movie['overview'],
      poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
      rating: movie['vote_average'],
      release_date: movie['release_date'][0, 4].to_i,
      popularity: movie['popularity']
    )
  end
  n += 1
end

puts "#{Movie.count} have been created"

# Adding missing Star Wars movies !!!???
puts "adding Return of the Jedi and The Empire strikes back into the Star Wars collection"
empire = Movie.where("title ILIKE '%the empire strikes back%'")[0]
empire.title = "Star Wars The Empire Strikes Back"
empire.save
jedi = Movie.where("title ILIKE '%return of the jedi%'")[0]
jedi.title = "Star Wars Return of the Jedi"
jedi.save
puts "Star Wars done"

# Creating categories
categories = ['horror', 'fun', 'thriller', 'weekend', 'historic']

categories.each do |cat|
  List.create(name: cat, user_id: initial_user.id)
end

puts "Created #{List.count} lists"

# Creating 10 bookmarks
50.times do
  Bookmark.create(comment: Faker::Quote.famous_last_words, movie_id: Movie.all.sample.id, list_id: List.all.sample.id)
end

puts "Created #{Bookmark.count} bookmarks"
