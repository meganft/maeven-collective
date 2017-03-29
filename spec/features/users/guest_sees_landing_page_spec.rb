require 'rails_helper'

describe "a guest user can visit root path" do
  it "and they see basic data" do
    visit root_path
    expect(page).to have_content("the maeven collective")
    expect(page).to have_content("LOG IN")
    expect(page).to have_content("SIGN UP")
  end
end
