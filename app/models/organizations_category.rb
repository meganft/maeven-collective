# == Schema Information
#
# Table name: organizations_categories
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  category_id     :integer
#
# Indexes
#
#  index_organizations_categories_on_category_id      (category_id)
#  index_organizations_categories_on_organization_id  (organization_id)
#

class OrganizationsCategory < ApplicationRecord
  belongs_to :organization
  belongs_to :category
end
