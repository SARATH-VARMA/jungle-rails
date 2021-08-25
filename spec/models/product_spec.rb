require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "saves successfully when all fields are set" do
      @category = Category.new
      @category.name = "Toys"
      @category.save
      @product = Product.new
      @product.category_id = @category.id;
      @product.name = "Car"
      @product.price = 200
      @product.quantity = 10
      @product.save
      expect(@product.errors).to be_empty
    end

    it "invalid without a name" do
      @category = Category.new
      @category.name = "Toys"
      @category.save
      @product = Product.new
      @product.category_id = @category.id;
      @product.name = nil
      @product.price = 200
      @product.quantity = 10
      @product.save
      expect(@product.errors).not_to be_empty
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it "invalid without a price" do
      @categ = Category.new
      @categ.name = "Toys"
      @categ.save
      @product = Product.new
      @product.name = "Hot Wheels"
      @product.description = "xyz"
      @product.category = @categ
      @product.price_cents = nil
      @product.quantity = 10
      @product.save
      expect(@product.errors.full_messages).to include "Price is not a number"
    end

    it "invalid without a quantity" do
      @category = Category.new
      @category.name = "Toys"
      @category.save
      @product = Product.new
      @product.category_id = @category.id;
      @product.name = "Car"
      @product.price = 200
      @product.quantity = nil
      @product.save
      expect(@product.errors).not_to be_empty
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it "invalid without a category" do
      @product = Product.new
      @product.category_id = nil;
      @product.name = "Car"
      @product.price = 2000
      @product.quantity = 10
      @product.save
      expect(@product.errors).not_to be_empty
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end