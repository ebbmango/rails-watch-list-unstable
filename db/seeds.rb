# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# SETUP

API_KEY = 'API_KEY_HERE'
IMAGE_BASE_URL = 'https://image.tmdb.org/t/p/original/'

# URL for fetching images
def get_poster_url(poster_path)
  "https://image.tmdb.org/t/p/original/#{poster_path}"
end

# URL for browsing most popular movies
def get_details_url(page_number, api_key)
  "https://api.themoviedb.org/3/movie/popular?api_key=#{api_key}&language=en-US&page=#{page_number}"
end

# EXECUTION

html_file = RestClient.get(get_details_url(1, API_KEY))
html_data = JSON.parse(html_file)

movies_data = html_data['results']

puts "Filling the database with #{movies_data.count} movies"

movies_data.each do |movie_data|
  movie = Movie.new(
    title: movie_data['title'],
    overview: movie_data['overview'],
    poster_url: get_poster_url(movie_data['poster_path']),
    rating: movie_data['vote_average']
  )
  puts "Successfully created movie '#{movie.title}', with id #{movie.id}" if movie.save!
end
