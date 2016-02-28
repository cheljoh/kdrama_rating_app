class RatingTitle < ActiveRecord::Base
  belongs_to :rating
  belongs_to :title
end
