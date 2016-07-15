module ValidationHelper

  def havent_left_review_yet(movie)
    !movies_already_reviewed.include?(movie.id)
  end

  def movies_already_reviewed
    current_user.reviews.map { |rev| rev.movie_id }
  end

  def havent_rated_yet(rev)
    !users_who_already_rated_this_review(rev).include?(current_user.id)
  end

  def users_who_already_rated_this_review(rev)
    rev.ratings.map { |rat| rat.rater_id }
  end

  def not_your_own(obj)
    !authorized?(obj)
  end

end
