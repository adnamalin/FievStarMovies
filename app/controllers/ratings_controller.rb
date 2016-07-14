class RatingsController < ApplicationController
  def review_new
    logged_in_access
    @review = Review.find(params[:review_id])


  def movie_new
    logged_in_access
    @movie = Movie.find(params[:movie_id])
    @rating = Rating.new
  end

  def review_create
    logged_in_access
    review = Review.find(params[:review_id])
    review.ratings.create!(rating: params[:rating][:rating],
      rater_id:current_user.id)
    if review.save!
      movie = Review.find(params[:review_id]).movie
      redirect_to movie_path(movie.id)
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
>>>>>>> 6765257859bb2fce0851f1e2e976c460750b3630
  end
end
