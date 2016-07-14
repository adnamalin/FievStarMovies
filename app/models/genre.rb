class Genre < ActiveRecord::Base
  has_many :assignments
  has_many :movies, through: :assignments

end
