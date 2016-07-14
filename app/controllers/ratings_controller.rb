class RatingsController < ApplicationController
  def new
    logged_in_access
    @review = Review.find(params[:review_id])
  end

  def movie_new
    logged_in_access
    @movie = Movie.find(params[:movie_id])
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

  def movie_create
    logged_in_access
    @movie = Movie.find(params[:movie_id])
    @rating = @movie.ratings.new(rating_params)
    @rating.save
    redirect_to new_movie_review_path(@movie)
  end

  private
  def rating_params
    params.require(:rating).permit(:rating).merge(rater_id: current_user.id)
  end
end
