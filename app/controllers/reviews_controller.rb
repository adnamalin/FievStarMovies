class ReviewsController < ApplicationController
  def index
    @reviews = Movie.find(params[:movie_id]).reviews
  end
end
