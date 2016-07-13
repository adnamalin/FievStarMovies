class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :body, presence: true
  validates :reviewer_id, presence: true
  validates :movie_id, presence: true
end
