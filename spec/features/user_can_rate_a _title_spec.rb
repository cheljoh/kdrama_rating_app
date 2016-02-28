require 'rails_helper'

RSpec.feature "user can rate a title" do
  scenario "user rates an existing title" do
    user = User.create(username: "Waldo", password: "password")
    title_image_path1 = "https://goodbyenavi.files.wordpress.com/2012/02/boys_over_flower_16072009204054.jpg"

    category = Category.create(name: "Romcom")

    title = Title.create(name: "Boys Over Flowers", image_path: title_image_path1, category_id: category.id)

    visit title_path(title)
    click_on "Rate this Title!"

    # visit new_title_rating_path(title.id)

    fill_in "Score", with: 5
    click_on "Create Rating"
    click_on "Back to Title"
    expect(page).to have_content("Average score: 5")
  end

end

# <%= stylesheet_link_tag    'application', media: 'all' %>
# <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
# <%= javascript_include_tag 'application' %>
# <%= csrf_meta_tags %>
