# == Schema Information
#
# Table name: offerings_tags
#
#  id          :integer          not null, primary key
#  offering_id :integer
#  tag_id      :integer
#
# Indexes
#
#  index_offerings_tags_on_offering_id  (offering_id)
#  index_offerings_tags_on_tag_id       (tag_id)
#

class OfferingsTag < ApplicationRecord
  belongs_to :offering
  belongs_to :tag
end
