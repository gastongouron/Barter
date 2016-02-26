require "rails_helper"

RSpec.feature "Users can create new helps" do

  before do

    service = FactoryGirl.create(:service, name: "Internet Explorer")
    user = FactoryGirl.create(:user)
    define_permission!(user, "view", service)
    @email = user.email
    sign_in_as!(user)

    visit '/'
    click_link service.name
    click_link "New Help"

  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "My pages are ugly!"
    click_button "Create Help"
    expect(page).to have_content "Help has been created."
    within "#author" do
      expect(page).to have_content("Created by #{@email}")
    end
  end
  scenario "when providing invalid attributes" do
    click_button "Create Help"
    expect(page).to have_content "Help has not been created."
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Description can't be blank"
  end
  scenario "with an invalid description" do
    fill_in "Name", with: "Non-standards compliance"
    fill_in "Description", with: "pff"
    click_button "Create Help"
  expect(page).to have_content "Help has not been created."
  expect(page).to have_content "Description is too short"
  end
end