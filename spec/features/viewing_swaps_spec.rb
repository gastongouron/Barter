require 'spec_helper'
feature "Viewing swaps" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:swap) { FactoryGirl.create(:swap) }
  before do
    sign_in_as!(user)
    define_permission!(user, :view, swap)
  end
  scenario "Listing all swaps" do
    visit '/'
    click_link swap.name
    expect(page.current_url).to eql(swap_url(swap))
  end
end