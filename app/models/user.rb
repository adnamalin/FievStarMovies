class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, foreign_key: :reviewer_id
  has_many :comments, foreign_key: :commenter_id
  validates :username, presence: true, uniqueness: true

  def average_review_rating
    reviews_ratings = self.reviews.map do |review|
      next if !review.average_rating.instance_of? Float
      review.average_rating
    end
    reviews_ratings.delete(nil)
    average = reviews_ratings.reduce(:+).to_f/reviews_ratings.length
    average.round(2)
  end

  def trusted_reviewer?
    if average_review_rating > 3
      true
    else
      false
    end
  end
end
