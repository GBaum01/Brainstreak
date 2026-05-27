class Student < ApplicationRecord
  belongs_to :user
  belongs_to :year_group

  validates :name, presence: true
  validates :year_group, presence: true
end
