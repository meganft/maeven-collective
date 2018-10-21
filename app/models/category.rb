# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  has_many :organizations_categories
  has_many :organizations, through: :organizations_categories, :dependent => :delete_all

  accepts_nested_attributes_for :organizations

end
