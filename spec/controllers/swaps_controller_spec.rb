# require 'rails_helper'

# RSpec.describe SwapsController, type: :controller do

# it "handles a missing swap correctly" do
#   get :show, id: "not-here"
#   expect(response).to redirect_to(swaps_path)
#   message = "The swap you were looking for could not be found."
#   expect(flash[:alert]).to eq message
# end

# end

require 'spec_helper'

describe SwapsController do
  let(:user) { FactoryGirl.create(:user) }
  context "standard users" do
    before do
      sign_in(user)
    end
    it "cannot access the new action" do
      get :new
      expect(response).to redirect_to('/')
      expect(flash[:alert]).to eql("You must be an admin to do that.")
    end
  end
end