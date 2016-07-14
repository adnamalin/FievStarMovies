class RatingsController < ApplicationController
  def new
    logged_in_access
    @review = Review.find(params[:review_id])
    @rating = Rating.new
  end

  def create
    logged_in_access
    review = Review.find(params[:review_id])
    review.ratings.create!(rating: params[:rating][:rating],
      rater_id:current_user.id)
    if review.save!
      movie = Review.find(params[:review_id]).movie
      redirect_to movie_path(movie.id)
    end
  end
end
