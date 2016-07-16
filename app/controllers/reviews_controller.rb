class ReviewsController < ApplicationController

  def new
    @movie = Movie.find(params[:movie_id])
    @review = Review.new
    @rating = Rating.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create!(review_params)
    redirect_to @movie
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to @movie
  end

  private
  def review_params
    params.require(:review).permit(:title, :body).merge(reviewer_id: current_user.id)
  end
end
