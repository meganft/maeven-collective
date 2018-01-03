require 'rails_helper'

describe "Admin can visit dashboard" do
  scenario "and see all current organizations" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password", role: "admin")
    organization_1 = Organization.create(name: "Sample Org 1", website: "www.sample1.com", twitter: "@example1", instagram: "@exampleinstagram1", facebook: "@facebook1")
    organization_2 = Organization.create(name: "Sample Org 2", website: "www.sample2.com", twitter: "@example2", instagram: "@exampleinstagram2", facebook: "@facebook2")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content "Current Organizations"
    within(:css, "#current-organizations") do
      expect(page).to have_content(organization_1.name)
      expect(page).to have_content(organization_2.name)
    end
  end

  scenario "and see all current offerings" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password", role: "admin")
    organization_1 = Organization.create(name: "Sample Org 1", website: "www.sample1.com", twitter: "@example1", instagram: "@exampleinstagram1", facebook: "@facebook1")
    organization_2 = Organization.create(name: "Sample Org 2", website: "www.sample2.com", twitter: "@example2", instagram: "@exampleinstagram2", facebook: "@facebook2")
    offering_1 = organization_1.offerings.create(name: "Offering", format: "lecture", location: "Denver", price: "$49.99", description: "Fun lecture")
    offering_2 = organization_2.offerings.create(name: "Offering2", format: "lecture", location: "Boulder", price: "$79.99", description: "Boulder lecture")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content(offering_1.name.capitalize)
    expect(page).to have_content(offering_2.name.capitalize)
  end
end
