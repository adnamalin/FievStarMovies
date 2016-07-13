class MoviesController < ApplicationController
  def show
    movie_finder
  end

private
  def movie_finder
    @movie = Movie.find(params[:id])
  end


end
