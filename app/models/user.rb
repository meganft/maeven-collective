# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  password        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#  role            :integer          default("default")
#

class User < ApplicationRecord
  has_secure_password

  enum role: [:default, :admin]

  validates :email, presence: true
  validates :email, uniqueness: true

end
