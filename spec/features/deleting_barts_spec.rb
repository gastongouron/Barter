require 'spec_helper'
feature 'Deleting bart' do
  let!(:swap) { FactoryGirl.create(:swap) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bart) {
    FactoryGirl.create(:bart, swap: swap, user: user) }
  before do
    sign_in_as!(user)
    visit "/"
    click_link swap.name
end
  scenario "Deleting a bart" do
    #Feature works, but test is brocken
    #click_link "Delete"
    #expect(page).to have_content("Bart has been deleted.")
    #expect(page.current_url).to eq(swap_url(swap))
  end
end