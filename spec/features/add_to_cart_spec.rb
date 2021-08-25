require 'rails_helper'

RSpec.feature "Add to card", type: :feature, js:true do

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

    scenario "Number of products change from 0 to 1 in My Cart when clicked Add" do

      visit root_path

      puts page.html
      within('#navbar') { expect(page).to have_content('My Cart (0)') }

      first(".button_to").click
      puts page.html

      within('#navbar') { expect(page).to_not have_content('My Cart (0)') }
      within('#navbar') { expect(page).to have_content('My Cart (1)') }

        # DEBUG / VERIFY
      save_screenshot
    end
end