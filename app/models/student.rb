class Student < ApplicationRecord
  belongs_to :user
  belongs_to :year_group_id

  validates :name, presence: true
end
