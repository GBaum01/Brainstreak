class Student < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :yeargroup, numericality: { only_integer: true, greater_than: 0 }
end
