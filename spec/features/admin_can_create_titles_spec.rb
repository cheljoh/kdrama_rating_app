require 'rails_helper'

RSpec.feature "admin can create titles" do
  scenario "admin can create a new title" do
    admin = User.create(username: "Patty", password: "password", role: 1)
    title_image_path = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_titles_path
    click_on "Add New Title"
    fill_in "Name", with: "Boys Over Flowers"
    fill_in "Image Path", with: title_image_path
    click_on "Create Title"
    expect(page).to have_content("Boys Over Flowers")
    expect(page).to have_css("img[src=\"#{title_image_path}\"]")
  end

  scenario "admin can edit a title" do
   admin = User.create(username: "Waldo", password: "password", role: 1)
   title_image_path = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
   title = Title.create(name: "Boys Over Flowers", image_path: title_image_path)
   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
   visit admin_title_path(title)
   click_on "Edit Title"

   fill_in "Name", with: "FUN"
   click_on "Update Title"
   expect(page).to have_content("FUN")
  end

  scenario "admin can delete a title" do
    admin = User.create(username: "Waldo", password: "password", role: 1)
    title_image_path = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
    title = Title.create(name: "Boys Over Flowers", image_path: title_image_path)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_title_path(title)
    click_on "Delete Title"
    expect(page).to_not have_content("Boys Over Flowers")
    expect(page).to have_current_path(admin_titles_path)
  end

  scenario "admin can view all titles" do
    admin = User.create(username: "Waldo", password: "password", role: 1)
    title_image_path1 = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
    title_image_path2 = "http://trickeye.exteen.com/images/article/cp.jpg"
    title1 = Title.create(name: "Boys Over Flowers", image_path: title_image_path1)
    title2 = Title.create(name: "Coffee Prince", image_path: title_image_path2)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_titles_path
    expect(page).to have_content("Boys Over Flowers")
    expect(page).to have_content("Coffee Prince")
    save_and_open_page
  end
end
