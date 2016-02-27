require 'rails_helper'

RSpec.feature "user can register" do
  let!(:user) {User.create(username: "chelsea", password: "password")}
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


    # puts subject.current_user.username
    # returns Admir when only chelsea is in db. Admir from another stub. Test order?
    # save_and_open_page
    expect(page).to have_current_path(user_path(user))

    expect(page).to have_content("Welcome chelsea")

  end

end
