class Student < ApplicationRecord
  belongs_to :user
  belongs_to :year_group

  validates :name, presence: true
end
