class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
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
