class Tag < ApplicationRecord
  has_many :offerings_tags, :dependent => :nullify
  has_many :offerings, through: :offerings_tags, :dependent => :nullify
end
