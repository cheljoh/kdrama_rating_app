require 'rails_helper'

RSpec.feature "user can navigate from dashboard" do
  scenario "user can navigate to categories" do
    user = User.create(username: "Waldo", password: "password")
    title_image_path1 = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
    title_image_path2 = "http://trickeye.exteen.com/images/article/cp.jpg"
    title_image_path3 = "https://www.dramafever.com/st/image-boss/resize.jpg?h=360&url=http%3A%2F%2Fwww.dramafever.com%2Fst%2Fimg%2Fepth%2Fc_224.jpg&w=640"
    category1 = Category.create(name: "Romcom")
    category2 = Category.create(name: "Comedy")
    title1 = Title.create(name: "Boys Over Flowers", image_path: title_image_path1, category_id: category1.id)
    title2 = Title.create(name: "Coffee Prince", image_path: title_image_path2, category_id: category2.id)
    title3 = Title.create(name: "City Hunter", image_path: title_image_path3, category_id: category1.id)
    visit "/"
    click_on "View Kdramas by Category"
    expect(page).to have_content("Romcom")
    expect(page).to have_content("Comedy")
  end

  scenario "user can navigate to titles" do
    user = User.create(username: "Waldo", password: "password")
    title_image_path1 = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"
    title_image_path2 = "http://trickeye.exteen.com/images/article/cp.jpg"
    title_image_path3 = "https://www.dramafever.com/st/image-boss/resize.jpg?h=360&url=http%3A%2F%2Fwww.dramafever.com%2Fst%2Fimg%2Fepth%2Fc_224.jpg&w=640"
    category1 = Category.create(name: "Romcom")
    category2 = Category.create(name: "Comedy")
    title1 = Title.create(name: "Boys Over Flowers", image_path: title_image_path1, category_id: category1.id)
    title2 = Title.create(name: "Coffee Prince", image_path: title_image_path2, category_id: category2.id)
    title3 = Title.create(name: "City Hunter", image_path: title_image_path3, category_id: category1.id)
    visit "/"
    click_on "View All Kdramas"
    expect(page).to have_content("Boys Over Flowers")
    expect(page).to have_content("Coffee Prince")
  end

end
