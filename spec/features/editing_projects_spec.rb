require "rails_helper"

RSpec.feature "Users can edit existing swaps" do
  scenario "with valid attributes" do
    FactoryGirl.create(:swap, name: "Sublime Text 3")
    visit "/"
    click_link "Sublime Text 3"
    click_link "Edit Swap"
    fill_in "Name", with: "Sublime Text 4 beta"
    click_button "Update Swap"
  expect(page).to have_content "Swap has been updated."
  expect(page).to have_content "Sublime Text 4 beta"
  end

end