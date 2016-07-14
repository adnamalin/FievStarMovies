class MoviesController < ApplicationController
  def index
    @genres = Genre.all.map { |gen| gen.genre.capitalize }
    @movies = Movie.all
    if params[:genre] != nil
      @movies = @movies.select {|mov| mov.display_genres.include?(params[:genre])}
    end
  end

  def show
    movie_finder
  end

private
  def movie_finder
    @movie = Movie.find(params[:id])
  end
end
