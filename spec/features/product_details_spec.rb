require 'rails_helper'

RSpec.feature "Visitor clicks on product in home page", type: :feature, js: true do
   #SETUP
   before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Visitor can see product details when clicks on product in home page" do
    visit root_path

    puts page.html
    first(".product img").click

  save_screenshot
    expect(page).to have_content("Description")
    expect(page).to have_content("Name")
    expect(page).to have_content("Price")
    expect(page).to have_content("Quantity")
end
end 