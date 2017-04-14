require 'rails_helper'

describe "As a logged in user" do
  it "I can logout of my account" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password")
    organization = Organization.create(name: "Megan")
    featured = Offering.create(name: "Offering")
    organization.offerings << featured

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content(user.first_name.upcase)

    visit logout_path 
    expect(page).to have_content("You have successfully logged out")
    expect(current_path).to eq(root_path)
  end
end
