class Student < ApplicationRecord
  belongs_to :user
  belongs_to :year_group

  validates :first_name, presence: true
  validates :year_group, presence: true
end
