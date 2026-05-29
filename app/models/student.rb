class Student < ApplicationRecord
  belongs_to :user
  belongs_to :year_group
  has_many :practices

  validates :name, presence: true

  def topics
    Topic.where(year_group: year_group)
  end
end
