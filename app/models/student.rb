class Student < ApplicationRecord
  belongs_to :user
  belongs_to :year_group
  has_many :practices

  validates :name, presence: true
  validates :year_group, presence: true
end
