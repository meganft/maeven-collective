require 'rails_helper'

describe "A user visits login page" do
  it "and they can login to their account" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password")
    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Login"

    expect(page).to have_content("Successfully logged in as #{user.first_name}!")
    expect(current_path).to eq(root_path)
  end

  it "and they cannot login with an incorrect password" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password")
    visit login_path

    fill_in "email", with: user.email
    fill_in "password", with: "wrong"
    click_button "Login"

    expect(page).to have_content("Login failed, please try again.")
    expect(current_path).to eq(login_path)
  end

  it "and they cannot login with an incorrect email" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password")
    visit login_path

    fill_in "email", with: "wrong_email"
    fill_in "password", with: user.password
    click_button "Login"

    expect(page).to have_content("Login failed, please try again.")
    expect(current_path).to eq(login_path)
  end
end
