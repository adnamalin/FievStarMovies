class MoviesController < ApplicationController
  def index
    @movies = Movie.paginate(:page => params[:page], :per_page => 2)
  end

  def show
    movie_finder
  end

private
  def movie_finder
    @movie = Movie.find(params[:id])
  end
end
