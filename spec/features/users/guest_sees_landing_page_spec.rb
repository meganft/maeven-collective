require 'rails_helper'

describe "a guest user can visit root path" do
  it "and they see basic data" do
    organization = Organization.create(name: "Megan")
    featured = Offering.create(name: "Offering")
    organization.offerings << featured
    
    visit root_path
    expect(page).to have_content("the maeven collective")
    expect(page).to have_content("LOG IN")
    expect(page).to have_content("SIGN UP")
    expect(page).to have_content(featured.name)
  end
end
