class ReviewsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
  end

  def create
  end

  def destroy
  end

end
