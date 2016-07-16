class CommentsController < ApplicationController

  def new
    logged_in_access
    @review = Review.find(params[:review_id])
    @comment = Comment.new
    render template: 'comments/_form', layout: false
  end

  def create
    logged_in_access
    comment = Comment.create!(commenter_id: current_user.id,
      comment: params[:comment][:comment], review_id: params[:review_id])
    if comment.save!
      movie = Review.find(params[:review_id]).movie
      render template: 'comments/_show', layout: false, locals: {comment: comment}
    end
  end
end
