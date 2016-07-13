class MoviesController < ApplicationController
  def show
    redirect_to movie_reviews_path(params[:id])
  end

  def index
    @movies = Movie.all
  end
end
