require 'rails_helper'

RSpec.describe Product, type: :model do
  it "is valid with valid attributes" do
    product = Product.new(name: "Sample Product", description: "Sample Description", price: 9.99)

    expect(product).to be_valid
  end

  it "is not valid without a name" do
    product = Product.new(name: nil, description: "Sample Description", price: 9.99)

    expect(product).to_not be_valid
    expect(product.errors[:name]).to include("can't be blank")
  end

  it "is not valid without a description" do
    product = Product.new(name: "Sample Product", description: nil, price: 9.99)

    expect(product).to_not be_valid
    expect(product.errors[:description]).to include("can't be blank")
  end

  it "is not valid without a price" do
    product = Product.new(name: "Sample Product", description: "Sample Description", price: nil)

    expect(product).to_not be_valid
    expect(product.errors[:price]).to include("can't be blank")
  end
end