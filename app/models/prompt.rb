class Prompt < ApplicationRecord
  belongs_to :student
  belongs_to :curriculum
  belongs_to :topic

  validates :year_level, :difficulty_level, :curriculum_id, :topic_id, presence: true
end
