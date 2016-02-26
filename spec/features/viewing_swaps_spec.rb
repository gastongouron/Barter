require 'spec_helper'
feature "Viewing services" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:service) { FactoryGirl.create(:service) }
  before do
    sign_in_as!(user)
    define_permission!(user, :view, service)
  end
  scenario "Listing all services" do
    visit '/'
    click_link service.name
    expect(page.current_url).to eql(service_url(service))
  end
end