class Rating < ActiveRecord::Base
  has_many :rating_titles
  has_many :titles, through: :rating_titles
  validates :score, numericality: {greater_than: 0, less_than: 6 }
end
