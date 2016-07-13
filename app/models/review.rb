class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :reviewer, class_name: "User"
  has_many :ratings, as: :rateable

  validates :body, presence: true
  validates :reviewer_id, presence: true
  validates :movie_id, presence: true

  def average_rating
    ratings = self.ratings.map { |rating| rating.rating }
    ratings.reduce(:+).to_f/ratings.length
  end
end
