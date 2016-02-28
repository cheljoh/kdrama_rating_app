require 'rails_helper'

RSpec.feature "admin can create titles" do
  scenario "admin can create a new title" do
    admin = User.create(username: "Patty", password: "password", role: 1)
    Category.create(name: "Romcom")
    title_image_path = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_titles_path
    click_on "Add New Title"
    fill_in "Name", with: "Boys Over Flowers"
    fill_in "Image Path", with: title_image_path
    select "Romcom", from: "title[category_id]"
    click_on "Create Title"
    expect(page).to have_content("Boys Over Flowers")
    expect(page).to have_css("img[src=\"#{title_image_path}\"]")
  end

  scenario "admin can edit a title" do
   Category.create(name: "Romcom")
   admin = User.create(username: "Waldo", password: "password", role: 1)
   title_image_path = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
   title = Title.create(name: "Boys Over Flowers", image_path: title_image_path, category_id: 1)
   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
   visit new_admin_title_path
   fill_in "Name", with: "Boys Over Flowers"
   fill_in "Image Path", with: title_image_path
   select "Romcom", from: "title[category_id]"
   click_on "Create Title"
   click_on "Edit Title"
   fill_in "Name", with: "FUN"
   click_on "Update Title"
   expect(page).to have_content("FUN")
  end

  scenario "admin can delete a title" do
    Category.create(name: "Romcom")
    admin = User.create(username: "Waldo", password: "password", role: 1)
    title_image_path = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit new_admin_title_path
    fill_in "Name", with: "Boys Over Flowers"
    fill_in "Image Path", with: title_image_path
    select "Romcom", from: "title[category_id]"
    click_on "Create Title"
    click_on "Delete Title"
    expect(page).to_not have_content("Boys Over Flowers")
    expect(page).to have_current_path(admin_titles_path)
  end

  scenario "admin can view all titles" do
    Category.create(name: "Romcom")
    Category.create(name: "Action")
    admin = User.create(username: "Waldo", password: "password", role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    title_image_path1 = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
    title_image_path2 = "http://trickeye.exteen.com/images/article/cp.jpg"
    visit new_admin_title_path
    fill_in "Name", with: "Boys Over Flowers"
    fill_in "Image Path", with: title_image_path1
    select "Romcom", from: "title[category_id]"
    click_on "Create Title"
    visit new_admin_title_path
    fill_in "Name", with: "Coffee Prince"
    fill_in "Image Path", with: title_image_path2
    select "Action", from: "title[category_id]"
    click_on "Create Title"
    visit admin_titles_path
    expect(page).to have_content("Boys Over Flowers")
    expect(page).to have_content("Coffee Prince")
  end

end
