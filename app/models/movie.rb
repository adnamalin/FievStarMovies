class Movie < ActiveRecord::Base
  has_many :reviews

  def average_rating
    # total = 0
    # self.reviews.each do |review|
    #   review.rating
  end

  def number_of_reviews
    self.reviews.count
  end

end
