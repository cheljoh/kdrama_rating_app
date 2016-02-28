class Rating < ActiveRecord::Base
  has_many :rating_titles
  has_many :titles, through: :rating_titles
end
