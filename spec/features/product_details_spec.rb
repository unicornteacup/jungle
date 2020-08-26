require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
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

  scenario "a user visits the home page, clicks on a product and is taken to the product details page" do
    visit root_path

    # commented out b/c it's for debugging only
    
    first('article.product').find_link('Details').click

    expect(page).to have_text('Description')

    save_screenshot
  end
end
