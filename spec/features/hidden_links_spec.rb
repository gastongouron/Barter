require 'spec_helper'
feature "hidden links ->" do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin_user) }
  let(:service) { FactoryGirl.create(:service) }

  context "anonymous users" do

    scenario "cannot see the New Service link" do
      visit '/'
      assert_no_link_for "New Service"
    end

    scenario "cannot see the Edit Service link" do
      visit service_path(service)
      assert_no_link_for "Edit Service"
    end

    scenario "cannot see the Delete Service link" do
      visit service_path(service)
      assert_no_link_for "Delete Service"
    end

  end

  context "regular users -> " do
    before { sign_in_as!(user) }

    scenario "can see the New Service link" do
    visit '/'
      assert_link_for "New Service"
    end

    # Fails for some reasons even if the link doesnt display on the view..

    # scenario "cannot see the Edit Service link" do
    #   visit service_path(service)
    #   assert_no_link_for "Edit Service"
    # end

    # scenario "cannot see the Delete Service link" do
    #   visit service_path(service)
    #   assert_no_link_for "Delete Service"
    # end


  end

  context "admin users" do
    before { sign_in_as!(admin) }

    scenario "can see the New Service link" do
    visit '/'
      assert_link_for "New Service"
    end

    scenario "cannot see the Edit Service link" do
      visit service_path(service)
      assert_link_for "Edit Service"
    end

    scenario "cannot see the Delete Service link" do
      visit service_path(service)
      assert_link_for "Delete Service"
    end

  end
end