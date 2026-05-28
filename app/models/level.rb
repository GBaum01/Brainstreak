class Level < ApplicationRecord
  belongs_to :topic
  has_many :practices
end
