require "rails_helper"
RSpec.feature "Users can create new swaps" do
  scenario "with valid attributes" do
    visit "/"
    click_link "New Swap"
    fill_in "Name", with: "Sublime Text 3"
    fill_in "Description", with: "A text editor for everyone"
    click_button "Create Swap"
    expect(page).to have_content "Sublime Text 3 A text editor for everyone Project has been created."
    swap = Swap.find_by(name: "Sublime Text 3")
    expect(page.current_url).to eq swap_url(swap)

    title = "Sublime Text 3 - Swaps - Barter"
    expect(page).to have_title title
  end
end