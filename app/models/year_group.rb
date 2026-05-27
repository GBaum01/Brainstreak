class YearGroup < ApplicationRecord
  has_many :students
  has_many :topics

  validates :name, presence: true
end
