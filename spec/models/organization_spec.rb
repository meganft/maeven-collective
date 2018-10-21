# == Schema Information
#
# Table name: organizations
#
#  id                  :integer          not null, primary key
#  name                :string
#  website             :string
#  instagram           :string
#  twitter             :string
#  facebook            :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  description         :string
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  history             :string
#  slug                :string
#

require 'rails_helper'

describe Organization, type: :model do
  describe "validations" do
    context "invalid attributes" do
      scenario "it is invalid without a name" do
        organization = Organization.new(website: "www.sample1.com", twitter: "@example1", instagram: "@exampleinstagram1")
        expect(organization).to be_invalid
      end
    end
    context "valid attributes" do
      scenario "it is valid with a name" do
        organization = Organization.new(name: "New Org", website: "www.sample1.com", twitter: "@example1", instagram: "@exampleinstagram1")
        expect(organization).to be_valid
      end
    end
  end

  describe "relationships" do
    scenario "has many offerings" do
      organization = Organization.new(name: "Sample Org 1", website: "www.sample1.com", twitter: "@example1", instagram: "@exampleinstagram1")
      expect(organization).to respond_to(:offerings)
    end
  end

  describe "relationships" do
    scenario "has many categories" do
      organization = Organization.new(name: "Sample Org 1", website: "www.sample1.com", twitter: "@example1", instagram: "@exampleinstagram1")
      expect(organization).to respond_to(:categories)
    end
  end

  describe "self.search" do
    scenario "finds organizations with similar names" do
      organization = Organization.create(name: "test")
      expect(Organization.search("Test")).to include(organization)
    end
  end

  describe "self.filter" do
    scenario "finds similar organizations based on categories" do
      category = Category.new(name: "Business")
      organization1 = Organization.create(name: "First")
      organization1.categories << category
      organization2 = Organization.create(name: "Second")
      organization2.categories << category
      organization3 = Organization.create(name: "Third")

      expect(Organization.filter(category.id)).to include(organization2)
    end
  end

  describe "self.search_similar" do
    scenario "finds similar organizations based on organization" do
      category = Category.new(name: "Business")
      organization1 = Organization.create(name: "First")
      organization1.categories << category
      organization2 = Organization.create(name: "Second")
      organization2.categories << category
      organization3 = Organization.create(name: "Third")

      expect(Organization.search_similar(organization1)).to include(organization2)
    end
  end

  describe ".search_similar" do
    scenario "finds similar organizations based on organization" do
      category = Category.new(name: "Business")
      organization1 = Organization.create(name: "First")
      organization1.categories << category
      organization2 = Organization.create(name: "Second")
      organization2.categories << category
      organization3 = Organization.create(name: "Third")

      expect(Organization.search_similar(organization1)).to include(organization2)
    end
  end

  describe ".courses" do
    scenario "finds all courses for an organization" do
      organization = Organization.create(name: "Org")
      offering1 = Offering.create(name: "First offering", format: "course")
      offering2 = Offering.create(name: "Second offering", format: "online course")
      offering3 = Offering.create(name: "Third offering", format: "Course")
      offering4 = Offering.create(name: "Fourth offering", format: "conference")
      organization.offerings << [offering1, offering2, offering3, offering4]

      expect(organization.courses).to include(offering1, offering2)
      expect(organization.courses).to_not include(offering4)
    end
  end

  describe ".workshops" do
    scenario "finds all workshops for an organization" do
      organization = Organization.create(name: "Org")
      offering1 = Offering.create(name: "First offering", format: "workshop")
      offering2 = Offering.create(name: "Second offering", format: "Workshop")
      offering3 = Offering.create(name: "Third offering", format: "Course")

      organization.offerings << [offering1, offering2, offering3]

      expect(organization.workshops).to include(offering1, offering2)
      expect(organization.workshops).to_not include(offering3)
    end
  end

  describe ".consulting" do
    scenario "finds all consulting offerings for an organization" do
      organization = Organization.create(name: "Org")
      offering1 = Offering.create(name: "First offering", format: "consulting")
      offering2 = Offering.create(name: "Second offering", format: "Consulting")
      offering3 = Offering.create(name: "Third offering", format: "workshop")

      organization.offerings << [offering1, offering2, offering3]

      expect(organization.consulting).to include(offering1, offering2)
      expect(organization.consulting).to_not include(offering3)
    end
  end

end
