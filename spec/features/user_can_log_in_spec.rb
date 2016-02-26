require 'rails_helper'

RSpec.feature "user can log in" do
  scenario "user can log in from root page" do
    user = User.create(username: "Admir", password: "blah", role: 0)
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit '/'
    click_on "Login"
    expect(page).to have_current_path(login_path)
    fill_in "Username", with: "Admir"
    fill_in "Password", with: "blah"
    click_on "Submit"
    expect(page).to have_current_path(user_path(user))
    expect(page).to have_content "Welcome #{user.username}"
  end
end
