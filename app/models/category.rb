class Category < ApplicationRecord
  has_many :organizations_categories
  has_many :organizations, through: :organizations_categories
end
