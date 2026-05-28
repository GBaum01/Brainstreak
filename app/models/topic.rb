class Topic < ApplicationRecord
  belongs_to :year_group
  has_many :prompts
  has_many :levels
  validates :name, :year_group_id, presence: true
end
