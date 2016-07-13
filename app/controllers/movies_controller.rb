class MoviesController < ApplicationController
  def show
    redirect_to movie_reviews_path
  end
end
