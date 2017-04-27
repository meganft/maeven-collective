require 'rails_helper'

describe "As a logged in admin" do
  scenario "I can add a new organization" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password", role: "admin")
    category = Category.create(name: "Instagram")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_organization_path

    fill_in "organization[name]", with: "Example"
    fill_in "organization[website]", with: "www.example.com"
    fill_in "organization[twitter]", with: "@example"
    fill_in "organization[instagram]", with: "@exampleinstagram"
    fill_in "organization[facebook]", with: "organization"
    find(:css, ".category-selection").set(true)
    click_on "Create Organization"

    expect(page).to have_content("Created new organization Example")
    expect(current_path).to eq(admin_dashboard_path(user))
    expect(Organization.last.name).to eq("Example")
  end

  xit "I cannot add a new organization without a name" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password", role: "admin")
    category = Category.create(name: "Instagram")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_organization_path

    fill_in "organization[website]", with: "www.example.com"
    fill_in "organization[twitter]", with: "@example"
    fill_in "organization[instagram]", with: "@exampleinstagram"
    fill_in "organization[facebook]", with: "organization"
    fill_in "organization[facebook]", with: "organization"
    find(:css, ".category-selection").set(true)

    click_on "Create Organization"

    expect(page).to have_content("Name can't be blank")
    expect(Organization.last.website).to_not eq("www.example.com")
  end
end
