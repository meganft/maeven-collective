require 'rails_helper'

describe "Admin can log in" do
  scenario "and see admin dashboard" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password", role: "admin")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit login_path
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Login"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content "Admin Dashboard"
  end

  scenario "regular user cannot see admin dashboard" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content "The page you were looking for doesn't exist."
  end

  scenario "guest user cannot see admin dashboard" do
    visit admin_dashboard_path
    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
