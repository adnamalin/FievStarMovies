require 'httparty'

class Moviedbapi
  def initialize
    @api_key = "c53f45afaec37433217a385a706e45f1"
    @base_uri = "http://api.themoviedb.org/3"
  end

  def find_movie(id)
    response = HTTParty.get("#{@base_uri}/movie/#{id}?api_key=#{@api_key}")
    movie = Movie.find_by(title:response.parsed_response["title"])
    if !movie
      create_movie(response.parsed_response)
    else
      movie
    end
  end

  def seed_database
    5.times do |x|
      response = HTTParty.get("#{@base_uri}/movie/top_rated?page=#{x+1}&api_key=#{@api_key}")
      results = response.parsed_response["results"]
      results.each do |result|
        create_movie_from_top_rated(result)
      end
      sleep(30)
    end
  end

  private
  def create_movie(response)
    movie = Movie.new(title: response["title"],
      release_date: response["release_date"],
      description: response["overview"],
      poster: response["poster_path"])
    genres = response["genres"]
    genres.each do |genre|
      movie_genre = Genre.find_or_create_by(genre: genre["name"])
      movie.genres << movie_genre
    end
    movie.save!
    movie
  end

  def create_movie_from_top_rated(response)
    movie = Movie.new(title: response["title"],
      release_date: response["release_date"],
      description: response["overview"],
      poster: response["poster_path"])
    genre_ids = response["genre_ids"]
    genre_ids.each do |genre_id|
      movie.genres << create_genre(genre_id)
    end
    movie.save!
    movie
  end

  def create_genre(id)
    response = HTTParty.get("#{@base_uri}/genre/#{id}?api_key=#{@api_key}")
    Genre.find_or_create_by(genre: response.parsed_response["name"])
  end
end
