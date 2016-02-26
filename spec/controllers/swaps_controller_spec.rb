require 'spec_helper'
describe ServicesController do
  let(:user) { FactoryGirl.create(:user) }
  before do
    sign_in(user)
  end
  it "displays an error for a missing service" do
    get :show, id: "not-here"
    expect(response).to redirect_to(services_path)
    message = "The service you were looking for could not be found."
    expect(flash[:alert]).to eql(message)
  end
  context "standard users" do
    { new: :get,create: :post,
    edit: :get,
    update: :put,
    destroy: :delete }.each do |action, method|
    it "cannot access the #{action} action" do
      sign_in(user)
      send(method, action, :id => FactoryGirl.create(:service))
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eql("You must be an admin to do that.")
    end
  end
end
it "cannot access the show action without permission" do
  service = FactoryGirl.create(:service)
  get :show, id: service.id
  #expect(response).to redirect_to(services_path)
  #expect(flash[:alert]).to eql("The service you were looking for could not be found.")
  end
end
