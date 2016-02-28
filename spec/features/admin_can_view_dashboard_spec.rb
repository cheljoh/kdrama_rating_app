require 'rails_helper'

RSpec.feature "admin can view dashboard" do
  scenario "admin can view dashboard and navigate to titles and categories" do
    admin = User.create(username: "Patty", password: "password", role: 1)
    title_image_path = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_path
    click_on "Category Index"
    expect(page).to have_content("Category Index")
    visit admin_path
    click_on "Title Index"

    expect(page).to have_content("Title Index")
  end

end
