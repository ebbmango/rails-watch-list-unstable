# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

IMAGE_BASE_URL = 'https://image.tmdb.org/t/p/original/'

def get_image_url(movie_id, api_key)
  "https://api.themoviedb.org/3/movie/#{movie_id}/images?api_key=#{api_key}&language=en-US"
end

# URL for browsing most popular movies
def get_details_url(page_number, api_key)
  "https://api.themoviedb.org/3/movie/popular?api_key=#{api_key}&language=en-US&page=#{page_number}"
end
