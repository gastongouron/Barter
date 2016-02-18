require 'rails_helper'

describe Admin::UsersController do
  let(:user) { FactoryGirl.create(:user) }
  context "standard users" do
    before { sign_in(user) }
    it "are (not) able to access the index action" do
      get 'index'
      expect(response).not_to redirect_to('/')
      # expect(flash[:alert]).to eql("You must be an admin to do that.")
    end
  end
end