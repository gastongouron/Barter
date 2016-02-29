require "rails_helper"

  RSpec.feature "Users can edit existing helps" do
    let!(:service) { FactoryGirl.create(:service) }
    let!(:user) { FactoryGirl.create(:user) }

    let!(:help) do
      help = FactoryGirl.create(:help, service: service)
      help.update(user: user)
      help
    end

    # let!(:service) { FactoryGirl.create(:service) }
    # let!(:help) { FactoryGirl.create(:help, service: service) }

    before do
      sign_in_as!(user)
      visit service_help_path(service, help)
      click_link "Edit"
    end

    scenario "with valid attributes" do
    fill_in "Name", with: "Make it really shiny!"

    click_button "Update Help"
    expect(page).to have_content "Help has been updated."
      within("#help h2") do
        expect(page).to have_content "Make it really shiny!"
        expect(page).not_to have_content help.name
      end
    end

    scenario "with invalid attributes" do
    fill_in "Name", with: ""

    click_button "Update Help"
    expect(page).to have_content "Help has not been updated."
    end
end
