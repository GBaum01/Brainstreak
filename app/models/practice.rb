class Practice < ApplicationRecord
  belongs_to :student
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions

  validates :student, presence: true
  # or: validates :student_id, presence: true
end
