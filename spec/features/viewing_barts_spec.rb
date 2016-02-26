require "rails_helper"

RSpec.feature "Users can view helps" do

  before do
    sublime = FactoryGirl.create(:service, name: "Sublime Text 3")

    user = FactoryGirl.create(:user)
    help = FactoryGirl.create(:help,
        service: sublime,
        name: "Make it shiny!",
        description: "Gradients! Starbursts! Oh my!")
    help.update(user: user)

    ie = FactoryGirl.create(:service, name: "Internet Explorer")
    define_permission!(user, "view", ie)
    FactoryGirl.create(:help, service: ie,
      name: "Standards compliance", description: "Isn't a joke.")
    sign_in_as!(user)
    visit "/" end

    scenario "for a given service" do
      click_link "Sublime Text 3"
      expect(page).to have_content "Make it shiny!"
      expect(page).to_not have_content "Standards compliance"
      click_link "Make it shiny!"

      within("#help h2") do
        expect(page).to have_content "Make it shiny!"
      end
      expect(page).to have_content "Gradients! Starbursts! Oh my!"
    end
  end