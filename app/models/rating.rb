class Rating < ActiveRecord::Base
  belongs_to :rater, class_name: "User"
  belongs_to :rateable, :polymorphic => true
  validates :rater_id, uniqueness: { scope: [:rateable_type, :rateable_id], message:"You cannot rate a review more than once!"}
end
