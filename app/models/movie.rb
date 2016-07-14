class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :ratings, as: :rateable

  validates :title, presence: true, uniqueness: true
  validates :description, :director, :release_date, presence: true

  def average_rating
    if number_of_ratings == 0
      return 0
    else
      total = 0
      self.ratings.each do |rat|
        total += rat.rating
      end
      total/number_of_ratings
    end
  end

  def number_of_reviews
    self.reviews.count
  end

  def number_of_ratings
    self.ratings.count
  end
end
