class Tag < ApplicationRecord
  has_many :offerings_tags
  has_many :offerings, through: :offerings_tags, :dependent => :delete_all
end
