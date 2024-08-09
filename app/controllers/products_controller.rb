class ProductsController < ApplicationController
  #we generate basic authentication
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  before_action :authenticate, except: :index
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    products = Product.all

    render json: products, status: :ok
  end

  #GET /products/:id
  def show
    render json: @product
  end

  #POST /products
  def create
    product = Product.new(product_params)

    if product.save
      render json: product, status: :created
    else
      render json: product.errrors, status: :unprocessable_entity
    end
  end

  #PUT /products/:id
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  #DELETE /products/:id
  def destroy
    @product.destroy
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['ADMIN_USERNAME'] && password == ENV['ADMIN_PASSWORD']
    end
  end
end