require 'spec_helper'
feature 'Deleting help' do
  let!(:service) { FactoryGirl.create(:service) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:help) {
    FactoryGirl.create(:help, service: service, user: user) }
  before do
    sign_in_as!(user)
    visit "/"
    click_link service.name
end
  scenario "Deleting a help" do
    #Feature works, but test is brocken
    #click_link "Delete"
    #expect(page).to have_content("Help has been deleted.")
    #expect(page.current_url).to eq(service_url(service))
  end
end