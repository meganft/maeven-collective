class User < ApplicationRecord
  has_secure_password

  enum role: [:default, :admin]

  validates :password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

end
