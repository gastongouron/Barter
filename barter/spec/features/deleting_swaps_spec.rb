require "rails_helper"
  RSpec.feature "Users can delete swaps" do
    scenario "successfully" do
      FactoryGirl.create(:swap, name: "Sublime Text 3")
      visit "/"
      click_link "Sublime Text 3"
      click_link "Delete Swap"
    expect(page).to have_content "Swap has been deleted."
    expect(page.current_url).to eq swaps_url
    expect(page).to have_no_content "Sublime Text 3"
    end
end