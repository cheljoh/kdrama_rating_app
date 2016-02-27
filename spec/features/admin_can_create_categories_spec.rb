require 'rails_helper'

RSpec.feature "admin can create categories" do
  scenario "admin can create a new category" do
    admin = User.create(username: "Patty", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_categories_path
    click_on "Add New Category"
    fill_in "Name", with: "Romance"
    click_on "Create Category"
    expect(page).to have_content("Romance")
  end

  scenario "admin can edit a category" do
   admin = User.create(username: "Waldo", password: "password", role: 1)
   category = Category.create(name: "Romance")
   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
   visit admin_category_path(category)
   click_on "Edit Category"

   fill_in "Name", with: "Action"
   click_on "Update Category"
   expect(page).to have_content("Action")
  end
  #
  scenario "admin can delete a category" do
    admin = User.create(username: "Waldo", password: "password", role: 1)
    category = Category.create(name: "Romance")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_category_path(category)
    click_on "Delete"
    expect(page).to_not have_content("Romance")
    expect(page).to have_current_path(admin_categories_path)
  end
end
