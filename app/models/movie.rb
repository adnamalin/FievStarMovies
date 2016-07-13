class Movie < ActiveRecord::Base
  has_many :ratings

  validates :title, presence: true, uniqueness: true
  validates :description, :director, :release_date, presence: true

  def average_rating
    total = 0
    ratings = self.ratings
    ratings.each do |r|
      total += r.rating
    end
    average = total/ratings.length
  end

end
