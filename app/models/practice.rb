class Practice < ApplicationRecord
  belongs_to :student
  has_many :questions

  validates :student, presence: true
  # or: validates :student_id, presence: true
end
