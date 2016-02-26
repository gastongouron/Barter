require "rails_helper"

RSpec.feature "Users can create new services" do

  before do
  sign_in_as!(FactoryGirl.create(:admin_user))
  visit "/"
    click_link "New Service"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "A text editor for everyone"
    # fill_in "Location", with: "Paris, France"
    click_button "Create Service"
    expect(page).to have_content "Service has been created."
    service = Service.find_by(name: "Sublime Text 3")
    expect(page.current_url).to eq service_url(service)
    title = "Sublime Text 3 - Services - Helper"
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do
    click_button "Create Service"
    expect(page).to have_content "Service has not been created."
    expect(page).to have_content "Name can't be blank"
  end
end