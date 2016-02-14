require "rails_helper"
  RSpec.feature "Users can view swaps" do
    scenario "with the swap details" do
      swap = FactoryGirl.create(:swap)
      visit "/"
      click_link "Example swap"
    expect(page.current_url).to eq swap_url(swap)
  end
end