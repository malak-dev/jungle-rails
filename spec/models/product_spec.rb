require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe "Validations" do
    category=Category.new(name:"Apparel")
    product=Product.new(name: "Human Feet Shoes",price:1000,quantity:2,category:category)
    
      it "should have a name " do
          product.name = nil
          product.save
          expect(["Name can't be blank"]).to eql (product.errors.full_messages)
        end
      it "should have a price" do
          product.price = nil
          product.save
          expect(["Price is not a number"]).to eql (product.errors.full_messages)

        end
      it "should have a quantity" do
          expect(product.quantity).to be_present
        end
      it "should have a category" do
          expect(product.category).to be_present
        end
    end
  end