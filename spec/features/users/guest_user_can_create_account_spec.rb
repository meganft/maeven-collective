require 'rails_helper'

describe "A user visits signup page" do
  it "and they can create an account with all information" do
    visit new_user_path

    fill_in "user[first_name]", with: "first_name"
    fill_in "user[last_name]", with: "last_name"
    fill_in "user[email]", with: "example@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    click_on "Create Account"

    expect(page).to have_content("Successfully created an account!")
    expect(User.last.first_name).to eq("first_name")
    expect(current_path).to eq(root_path)
  end

  it "and they cannot create an account without an email" do
    visit new_user_path

    fill_in "user[first_name]", with: "first_name"
    fill_in "user[last_name]", with: "last_name"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    click_on "Create Account"

    expect(page).to have_content("Email can't be blank")
  end

  it "and they cannot create an account without a password" do
    visit new_user_path

    fill_in "user[first_name]", with: "first_name"
    fill_in "user[last_name]", with: "last_name"
    fill_in "user[email]", with: "email@example.com"
    fill_in "user[password_confirmation]", with: "password"

    click_on "Create Account"

    expect(page).to have_content("Password can't be blank")
  end

  it "and they cannot create an account without a password confirmation" do
    visit new_user_path

    fill_in "user[first_name]", with: "first_name"
    fill_in "user[last_name]", with: "last_name"
    fill_in "user[email]", with: "email@example.com"
    fill_in "user[password_confirmation]", with: "password"

    click_on "Create Account"

    expect(page).to have_content("Password can't be blank")
  end

  it "and they cannot create an account without a password that does not match a password confirmation" do
    visit new_user_path

    fill_in "user[first_name]", with: "first_name"
    fill_in "user[last_name]", with: "last_name"
    fill_in "user[email]", with: "email@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "wrong_password"

    click_on "Create Account"

    expect(page).to have_content("Password confirmation doesn't match Password")
  end

  it "and they cannot create an account without a unique email" do
    user = User.create(first_name: "Bob", last_name: "Smith", email: "bob@example.com", password: "password", password_confirmation: "password")
    visit new_user_path

    fill_in "user[first_name]", with: "first_name"
    fill_in "user[last_name]", with: "last_name"
    fill_in "user[email]", with: "bob@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    click_on "Create Account"

    expect(page).to have_content("Email has already been taken")
  end
end
