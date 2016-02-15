require "rails_helper"

RSpec.feature "Users can create new barts" do

  before do
    swap = FactoryGirl.create(:swap)
    user = FactoryGirl.create(:user)
    visit '/'
    click_link swap.name
    click_link "New Bart"
    message = "You need to sign in or sign up before continuing."
    expect(page).to have_content(message)
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_button "Sign in"
    click_link swap.name
    click_link "New Bart"
  end

  before do
    swap = FactoryGirl.create(:swap, name: "Internet Explorer")
    visit swap_path(swap)
    click_link "New Bart"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Bart"
    expect(page).to have_content "Bart has been created."
    within "#author" do
      expect(page).to have_content("Created by sample@example.com")
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