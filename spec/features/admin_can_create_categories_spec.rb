require 'rails_helper'

RSpec.feature "admin can create categories" do
  scenario "admin can create a new category" do
    admin = User.create(username: "Patty", password: "password", role: 1)
    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit root_path
    click_on "Add New Category"
    fill_in "Name", with: "Romance"
    click_on "Add Category"
    expect(page).to have_content("Romance")
  end

  scenario "admin can edit a category" do

  end

  scenario "admin can delete a category" do

  end
end
