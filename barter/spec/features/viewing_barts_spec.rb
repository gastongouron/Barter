require "rails_helper"

RSpec.feature "Users can view barts" do

  before do
    sublime = FactoryGirl.create(:swap, name: "Sublime Text 3")
    user = FactoryGirl.create(:user)
    bart = FactoryGirl.create(:bart,
        swap: sublime,
        name: "Make it shiny!",
        description: "Gradients! Starbursts! Oh my!")
    bart.update(user: user)

    ie = FactoryGirl.create(:swap, name: "Internet Explorer")
    FactoryGirl.create(:bart, swap: ie,
      name: "Standards compliance", description: "Isn't a joke.")
    visit "/" end

    scenario "for a given swap" do
      click_link "Sublime Text 3"
      expect(page).to have_content "Make it shiny!"
      expect(page).to_not have_content "Standards compliance"
      click_link "Make it shiny!"

      within("#bart h2") do
        expect(page).to have_content "Make it shiny!"
      end
      expect(page).to have_content "Gradients! Starbursts! Oh my!"
    end
  end