class User < ApplicationRecord
  has_secure_password
  has_many :students, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
