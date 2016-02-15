require "rails_helper"

  RSpec.feature "Users can edit existing barts" do
    let!(:swap) { FactoryGirl.create(:swap) }
    let!(:user) { FactoryGirl.create(:user) }

    let!(:bart) do
      bart = FactoryGirl.create(:bart, swap: swap)
      bart.update(user: user)
      bart
    end

    # let!(:swap) { FactoryGirl.create(:swap) }
    # let!(:bart) { FactoryGirl.create(:bart, swap: swap) }

    before do
      sign_in_as!(user)
      visit swap_bart_path(swap, bart)
      click_link "Edit"
    end

    scenario "with valid attributes" do
    fill_in "Name", with: "Make it really shiny!"

    click_button "Update Bart"
    expect(page).to have_content "Bart has been updated."
      within("#bart h2") do
        expect(page).to have_content "Make it really shiny!"
        expect(page).not_to have_content bart.name
      end
    end

    scenario "with invalid attributes" do
    fill_in "Name", with: ""

    click_button "Update Bart"
    expect(page).to have_content "Bart has not been updated."
    end
end
