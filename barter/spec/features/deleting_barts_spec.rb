require 'spec_helper'
feature 'Deleting barts' do
  let!(:swap) { FactoryGirl.create(:swap) }
  let!(:bart) { FactoryGirl.create(:bart, swap: swap) }
  before do
    visit '/'
    click_link swap.name
    click_link bart.name
end
  scenario "Deleting a bart" do
    click_link "Delete Bart"
    expect(page).to have_content("Bart has been deleted.")
    expect(page.current_url).to eq(swap_url(swap))
  end
end