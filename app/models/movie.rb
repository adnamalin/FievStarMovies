class Movie < ActiveRecord::Base
  has_many :ratings
  has_many :reviews

  validates :title, presence: true, uniqueness: true
  validates :description, :director, :release_date, presence: true

  def average_rating
    if number_of_reviews == 0
      return 0
    else
      total = 0
      self.ratings.each do |rat|
        total += rat.rating
      end
      total/number_of_reviews
    end
  end

  def number_of_reviews
    self.reviews.count
  end

end
