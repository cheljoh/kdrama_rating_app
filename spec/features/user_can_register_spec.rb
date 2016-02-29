require 'rails_helper'

RSpec.feature "user can register" do
  let!(:user) {User.create(username: "chelsea", password: "password")}
  scenario "user registers from the root page" do
    visit '/'
    click_on "Register"
    fill_in "Username", with: "chelsea"
    fill_in "Password", with: "password"
    click_on "Submit"
    user = User.last
    expect(page).to have_current_path(user_path(user))

    expect(page).to have_content("Welcome chelsea")

  end

end
