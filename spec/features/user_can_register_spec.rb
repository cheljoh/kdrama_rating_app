require 'rails_helper'

RSpec.feature "user can register" do
  scenario "user registers from the root page" do
    #when we visit the root, click on "register"
    #i fill out form with username and password and click submit
    #i am redirect to my user show page
    visit '/'
    click_on "Register"

    fill_in "Username", with: "chelsea"
    fill_in "Password", with: "password"
    click_on "Submit"
    user = User.last
    assert_equal "/users/#{user.id}", current_path

    expect(page).to have_content("Welcome chelsea")

  end

end
