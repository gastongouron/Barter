require "rails_helper"
  RSpec.feature "Users can delete services" do
  before do
    sign_in_as!(FactoryGirl.create(:admin_user))
  end
    scenario "successfully" do
      FactoryGirl.create(:service, name: "Sublime Text 3")
      visit "/"
      click_link "Sublime Text 3"
      click_link "Delete Service"
    expect(page).to have_content "Service has been deleted."
    expect(page.current_url).to eq services_url
    expect(page).to have_no_content "Sublime Text 3"
    end
end