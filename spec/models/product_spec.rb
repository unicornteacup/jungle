require 'rails_helper'
require 'Product'
require 'Category'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should save when all required fields are filled" do
      @category = Category.new(name: 'Ducks')
      @product = Product.new({name: "Roboduck", category: @category, quantity: 3, price: 49.99})

      @product.valid?

      expect(@product.errors.full_messages).to eq([])

    end

    it "should display Name can't be blank if no name is entered" do
      @category = Category.new(name: 'Ducks')
      @product = Product.new({name: nil, category: @category, quantity: 3, price: 49.99})
    
      @product.valid?
    
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should display Price is not a number if no price is entered" do
      @category = Category.new(name: 'Ducks')
      @product = Product.new({name: "Roboduck", category: @category, quantity: 3, price: nil})
    
      @product.valid?
    
      expect(@product.errors.full_messages).to include("Price is not a number")
    end

    it "should display Quantity can't be blank if no quantity is entered" do
      @category = Category.new(name: 'Ducks')
      @product = Product.new({name: "Roboduck", category: @category, quantity: nil, price: 49.99})
    
      @product.valid?
    
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "should display Category can't be blank if no category is entered" do
      @category = Category.new(name: 'Ducks')
      @product = Product.new({name: "Roboduck", category: nil, quantity: 3, price: 49.99})
    
      @product.valid?
    
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end


# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true
















