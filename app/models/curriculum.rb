class Curriculum < ApplicationRecord
  has_many :topics
  has_many :prompts
  validates :name, presence: true
end
