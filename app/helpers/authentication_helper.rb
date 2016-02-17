# for testing purposes: Make an helper with these methods/modules
module AuthenticationHelper
  def sign_in_as!(user)
    visit '/signin'
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_button 'Sign in'
    expect(page).to have_content("Signed in successfully.")
  end
end

module AuthHelpers
  def sign_in(user)
    session[:user_id] = user.id
  end
end

module CapybaraHelpers
  def assert_no_link_for(text)
    expect(page).to_not(have_css("a", :text => text),
      "Expected not to see the #{text.inspect} link, but did.")
  end
  def assert_link_for(text)
    expect(page).to(have_css("a", :text => text),
      "Expected to see the #{text.inspect} link, but did not.")
  end
end

# FOR TEST PURPOSES
# Comment when live testing unless I find a solution
RSpec.configure do |c|
  c.include AuthenticationHelper, type: :feature
  c.include AuthHelpers, type: :controller
  c.include CapybaraHelpers, :type => :feature
end