require 'rails_helper'

RSpec.describe SwapsController, type: :controller do

it "handles a missing swap correctly" do
  get :show, id: "not-here"
  expect(response).to redirect_to(swaps_path)
  message = "The swap you were looking for could not be found."
  expect(flash[:alert]).to eq message
end

end
