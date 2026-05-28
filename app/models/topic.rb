class Topic < ApplicationRecord
  belongs_to :curriculum
  has_many :prompts
  validates :name, :curriculum_id, presence: true
end
