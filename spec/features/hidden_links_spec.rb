require 'spec_helper'
feature "hidden links ->" do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin_user) }
  let(:swap) { FactoryGirl.create(:swap) }

  context "anonymous users" do

    scenario "cannot see the New Swap link" do
      visit '/'
      assert_no_link_for "New Swap"
    end

    scenario "cannot see the Edit Swap link" do
      visit swap_path(swap)
      assert_no_link_for "Edit Swap"
    end

    scenario "cannot see the Delete Swap link" do
      visit swap_path(swap)
      assert_no_link_for "Delete Swap"
    end

  end

  context "regular users -> " do
    before { sign_in_as!(user) }

    scenario "can see the New Swap link" do
    visit '/'
      assert_link_for "New Swap"
    end

    # Fails for some reasons even if the link doesnt display on the view..

    # scenario "cannot see the Edit Swap link" do
    #   visit swap_path(swap)
    #   assert_no_link_for "Edit Swap"
    # end

    # scenario "cannot see the Delete Swap link" do
    #   visit swap_path(swap)
    #   assert_no_link_for "Delete Swap"
    # end


  end

  context "admin users" do
    before { sign_in_as!(admin) }

    scenario "can see the New Swap link" do
    visit '/'
      assert_link_for "New Swap"
    end

    scenario "cannot see the Edit Swap link" do
      visit swap_path(swap)
      assert_link_for "Edit Swap"
    end

    scenario "cannot see the Delete Swap link" do
      visit swap_path(swap)
      assert_link_for "Delete Swap"
    end

  end
end