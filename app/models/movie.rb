class Movie < ActiveRecord::Base
  has_many :reviews

  def average_rating
    # total = 0
    # self.reviews.each do |review|
    #   review.rating
  end

end
