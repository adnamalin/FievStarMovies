class CommentsController < ApplicationController
  def new
    logged_in_access
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    logged_in_access
    comment = Comment.create!(commenter_id: current_user.id,
      comment: params[:comment][:comment], review_id: params[:review_id])
    if comment.save!
      movie = Review.find(params[:review_id]).movie
      redirect_to movie_path(movie.id)
    end
  end
end
