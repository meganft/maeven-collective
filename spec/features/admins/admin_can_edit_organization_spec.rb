require 'rails_helper'

describe "As a logged in admin" do
  it "I can edit an organization" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password", role: "admin")
    organization = Organization.create(name: "Sample Org 1", website: "www.sample1.com", twitter: "@example1", instagram: "@exampleinstagram1", facebook: "@facebook1")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_admin_organization_path(organization)


    fill_in "organization[website]", with: "www.updatedwebsite.com"
    click_on "Update Organization"

    expect(page).to have_content("Successfully updated #{organization.name}")
    expect(current_path).to eq(admin_organization_path)
    expect(Organization.last.website).to eq("www.updatedwebsite.com")
  end
end
