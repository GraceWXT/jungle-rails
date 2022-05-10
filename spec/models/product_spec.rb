require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.create(name: "Cacti")
    end

    it "creates a product with all four fields set" do
      @product = @category.products.create!(name: "Prickly Pear", price: 2500, quantity: 38, category: @category)

      expect(@product).to be_valid
    end

    it "throws an error for the name attribute if the product is saved without a name" do
      @product = @category.products.create(name: nil, price: 2500, quantity: 38, category: @category)

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "throws an error for the price attribute if the product is saved without a price" do
      @product = @category.products.create(name: "Prickly Pear", quantity: 38, category: @category)

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "throws an error for the quantity attribute if the product is saved without a quantity" do
      @product = @category.products.create(name: "Prickly Pear", price: 2500, quantity: nil, category: @category)

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "throws an error for the category attribute if the product is saved without a category" do
      @product = Product.create(name: "Prickly Pear", price: 2500, quantity: 38)

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end

end
