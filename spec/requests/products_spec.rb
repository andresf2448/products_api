require 'rails_helper'

RSpec.describe "Products", type: :request do
  let!(:product) { create(:product) }

  describe "GET /products" do
    it "returns all products" do
      get products_path(limit: 10, page: 1)

      expect(response.status).to eq(200)
      expect(json["products"].count).to eq(1)
    end
  end

  describe "GET /products/:id" do
    it "returns a single product" do
      get product_path(product), headers: auth_headers

      expect(response.status).to eq(200)
      expect(json["id"]).to eq(product.id)
    end
  end

  describe "POST /products" do
    it "creates a new product" do
      params = { 
        product: { 
          name: "Test", 
          description: "Test description", 
          price: 10.0
        }
      }

      expect {
        post products_path, params: params, headers: auth_headers
      }.to change(Product, :count).by(1)

      expect(response.status).to eq(201)
    end

    it "duplicate product" do
      params = { 
        product: { 
          name: "LLanta", 
          description: "Test description", 
          price: 10.0
        }
      }

      expect {
        post products_path, params: params, headers: auth_headers
      }.to change(Product, :count).by(0)

      expect(response.status).to eq(422)
      expect(json["name"].first).to eq("has already been taken")
    end
  end

  describe "PUT /products/:id" do
    it "updates an existing product" do
      params = { 
        product: { name: "Puerta" }
      }

      post product_path(product), params: params, headers: auth_headers

      product.reload
      expect(product.name).to eq("Puerta")
      expect(response.status).to eq(200)
    end
  end

  describe "DELETE /products/:id" do
    it "deletes a product" do
      expect {
        delete product_path(product), headers: auth_headers
      }.to change(Product, :count).by(-1)

      expect(response.status).to eq(200)
    end
  end
end