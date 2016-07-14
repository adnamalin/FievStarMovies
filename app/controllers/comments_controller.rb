class CommentsController < ApplicationController
  def new
    logged_in_access
    @comment = Comment.new
  end
end
