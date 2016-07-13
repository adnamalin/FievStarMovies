class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :ratings, as: :rateable

  validates :title, presence: true
end
