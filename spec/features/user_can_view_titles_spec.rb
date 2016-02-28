require 'rails_helper'

RSpec.feature "user can view titles" do
  scenario "user can view all titles" do
    user = User.create(username: "Waldo", password: "password")
    title_image_path1 = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
    title_image_path2 = "http://trickeye.exteen.com/images/article/cp.jpg"
    title1 = Title.create(name: "Boys Over Flowers", image_path: title_image_path1)
    title2 = Title.create(name: "Coffee Prince", image_path: title_image_path2)
    visit titles_path
    expect(page).to have_content("Boys Over Flowers")
    expect(page).to have_content("Coffee Prince")
  end

  scenario "user can view individual title" do
    user = User.create(username: "Waldo", password: "password")
    title_image_path = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
    title = Title.create(name: "Boys Over Flowers", image_path: title_image_path)
    visit titles_path
    click_on "Boys Over Flowers"
    expect(page).to have_current_path(title_path(title))
    expect(page).to have_content("Boys Over Flowers")
  end

end
