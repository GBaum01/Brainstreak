class Topic < ApplicationRecord
  belongs_to :year_group
  has_many :levels

  validates :name, presence: true
end
