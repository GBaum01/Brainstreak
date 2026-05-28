class Topic < ApplicationRecord
  belongs_to :curriculum
  has_many :prompts
  has_many :levels
  validates :name, :curriculum_id, presence: true
end
