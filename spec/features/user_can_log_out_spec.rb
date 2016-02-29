require 'rails_helper'

RSpec.feature "user can log out" do
  scenario "logged in user can log out" do
    user = User.create(username: "Molly", password: "blah")
    visit login_path
    fill_in "Username", with: "Molly"
    fill_in "Password", with: "blah"
    click_on "Submit"

    visit '/'
    click_on 'Logout'
    expect(page).to_not have_content("Welcome #{user.username}")
  end
end
