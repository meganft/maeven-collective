require 'rails_helper'

describe "a guest user can visit root path" do
  it "and they see basic data" do
    organization = Organization.create(name: "Megan")
    featured = Offering.create(name: "Offering")
    organization.offerings << featured

    visit root_path

    expect(page).to have_content("THE MAEVEN COLLECTIVE")
    expect(page).to have_content("sign up")
  end
end
