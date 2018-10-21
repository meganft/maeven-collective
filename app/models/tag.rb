# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  has_many :offerings_tags, :dependent => :nullify
  has_many :offerings, through: :offerings_tags, :dependent => :nullify
end
