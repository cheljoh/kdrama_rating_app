class Title < ActiveRecord::Base
  belongs_to :category
  validates :category, presence: true
end
