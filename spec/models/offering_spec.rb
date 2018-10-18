# == Schema Information
#
# Table name: offerings
#
#  id                  :integer          not null, primary key
#  name                :string
#  format              :string
#  location            :string
#  price               :string
#  organization_id     :integer
#  description         :string
#  date                :datetime
#  payment_options     :string
#  website             :string
#  materials           :string
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  length              :string
#
# Indexes
#
#  index_offerings_on_organization_id  (organization_id)
#

require 'rails_helper'

describe Offering, type: :model do
  describe "relationships" do
    scenario "belongs to an organization" do
      offering = Offering.new(name: "new offering")
      organization = Organization.new(name: "Sample Org 1", website: "www.sample1.com", twitter: "@example1", instagram: "@exampleinstagram1")
      expect(offering).to respond_to(:organization)
    end
  end

  describe "self.search" do
    scenario "finds all offerings with similar tags" do
      offering1 = Offering.create(name: "First")
      tag = Tag.create(name: "Instagram")
      offering1.tags << tag
      offering2 = Offering.create(name: "Second")
      tag2 = Tag.create(name: "Marketing")
      offering2.tags << tag2

      expect(Offering.search("instagram").first).to eq(offering1)
      expect(Offering.search("instagram").first).to_not eq(offering2)

      expect(Offering.search("marketing").first).to eq(offering2)
      expect(Offering.search("marketing").first).to_not eq(offering1)
    end
  end

  describe "self.search_format" do
    scenario "finds all offerings with similar formats" do
      offering1 = Offering.create(name: "First Offering Conference", format: "Conference")
      offering2 = Offering.create(name: "Second Offering Conference", format: "conference")
      offering3 = Offering.create(name: "First Offering Online Course", format: "Online course")

      expect(Offering.search_format("conference")).to include(offering2)
      expect(Offering.search_format("conference")).to_not include(offering3)

      expect(Offering.search_format("online course")).to include(offering3)
      expect(Offering.search_format("online course")).to_not include(offering1)
    end
  end

  describe ".similar" do
    scenario "finds offerings with similar formats to a specicic offering" do
      offering1 = Offering.create(name: "First Offering Conference", format: "Conference")
      offering2 = Offering.create(name: "Second Offering Conference", format: "conference")
      offering3 = Offering.create(name: "First Offering Online Course", format: "Online course")

      expect(offering1.similar).to include(offering2)
      expect(offering1.similar).to_not include(offering3)
    end
  end
end
