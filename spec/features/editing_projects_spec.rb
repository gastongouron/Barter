require "rails_helper"

RSpec.feature "Admin can edit existing services" do
  scenario "with valid attributes" do
    FactoryGirl.create(:service, name: "Sublime Text 3")
    sign_in_as!(FactoryGirl.create(:admin_user))
    visit "/"
    click_link "Sublime Text 3"
    click_link "Edit Service"
    fill_in "Name", with: "Sublime Text 4 beta"
    click_button "Update Service"
  expect(page).to have_content "Service has been updated."
  expect(page).to have_content "Sublime Text 4 beta"
  end

end