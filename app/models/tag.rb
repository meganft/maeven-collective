class Tag < ApplicationRecord
  has_many :offerings_tags
  has_many :offerings, through: :offerings_tags
end
