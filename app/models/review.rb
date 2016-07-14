class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :reviewer, class_name: "User"
  has_many :ratings, as: :rateable
  has_many :comments

  validate :movie_rating_presence
  validates :body, presence: true
  validates :reviewer_id, presence: true
  validates :movie_id, presence: true

  def movie_rating
    Rating.find_by(rater_id: self.reviewer.id, 
      rateable_id: self.movie.id, rateable_type: "Movie")
  end

  def movie_rating=(rating)
    rating.rater_id = self.reviewer.id
    rating.rateable_type = "Movie"
    rating.rateable_id = self.movie.id
    rating.save!
  end

  def average_rating
    ratings = self.ratings.map { |rating| rating.rating }
    average = ratings.reduce(:+).to_f/ratings.length
    average.round(2)
  end

  private
  def movie_rating_presence
    if !movie_rating
      errors.add(:movie_rating, "cannot be blank for a review")
    end
  end
end
