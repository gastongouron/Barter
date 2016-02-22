require "rails_helper"

RSpec.feature "Users can create new barts" do

  before do

    swap = FactoryGirl.create(:swap, name: "Internet Explorer")
    user = FactoryGirl.create(:user)
    define_permission!(user, "view", swap)
    @email = user.email
    sign_in_as!(user)

    visit '/'
    click_link swap.name
    click_link "New Bart"

  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Bart"
    expect(page).to have_content "Bart has been created."
    within "#author" do
      expect(page).to have_content("Created by #{@email}")
    end
  end
  scenario "when providing invalid attributes" do
    click_button "Create Bart"
    expect(page).to have_content "Bart has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
  scenario "with an invalid description" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "pff"
    click_button "Create Bart"
  expect(page).to have_content "Bart has not been created."
  expect(page).to have_content "Description is too short"
  end
end