class User < ApplicationRecord
  has_secure_password
  has_many :students, dependent: :destroy
end
