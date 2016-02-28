class Title < ActiveRecord::Base
  belongs_to :category
  validates :category, presence: true
  has_many :rating_titles
  has_many :ratings, through: :rating_titles
end
