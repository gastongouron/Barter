# for testing purposes: Make an helper with that

module AuthentificationHelper
  def sign_in_as!(user)
    visit '/signin'
    fill_in "Name", with: user.name
    fill_in "Password", with: user.password
    click_button 'Sign in'
    expect(page).to have_content("Signed in successfully.")
  end
end


# FOR TEST PURPOSES
# Comment when live testing unless I find a solution
# RSpec.configure do |c|
#   c.include AuthentificationHelper, type: :feature
# end