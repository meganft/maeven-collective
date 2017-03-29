class Offering < ApplicationRecord
  belongs_to :organization
  has_many :offerings_tags
  has_many :tags, through: :offerings_tags
end
