class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def index
    @movies = Movie.all
  end

  def show
    movie_finder
  end

private
  def movie_finder
    @movie = Movie.find(params[:id])
  end
end
