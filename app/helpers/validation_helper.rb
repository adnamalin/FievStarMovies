module ValidationHelper

  def havent_left_review_yet(movie)
    !movies_already_reviewed.include?(movie.id)
  end

  def movies_already_reviewed
    current_user.reviews.map { |rev| rev.movie_id }
  end

end
