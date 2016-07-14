class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :ratings, as: :rateable
  has_many :assignments
  has_many :genres, through: :assignments

  validates :title, presence: true, uniqueness: true
  validates :description, :release_date, presence: true

  def average_rating
    if number_of_ratings == 0
      return 0
    else
      total = 0
      self.ratings.each do |rat|
        total += rat.rating
      end
      (total/number_of_ratings).to_f
    end
  end

  def number_of_reviews
    self.reviews.count
  end


  def display_genres
    genres = self.genres.map { |gen| gen.genre }
    return genres.join(", ")
  end


  def number_of_ratings
    self.ratings.count
  end

end
