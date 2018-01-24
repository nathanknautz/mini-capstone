class ProductsController < ApplicationController

  def index
    products = Product.all
    
    render json: products.as_json
  end

  def create
    product = Product.new(name: params[:name],
                          price: params[:price],
                          image_url: params[:image_url],
                          description: params[:description])
    if product.save 
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def show
    product = Product.find(params[:id])
    render json: product.as_json
  end

  def update
    product = Product.find(params[:id])
    product.name = params[:name] || product.name 
    product.price = params[:price] || product.price
    product.image_url = params[:image_url] || product.image_url
    product.description = params[:description] || product.description
    product.in_stock = params[:in_stock] || product.in_stock
    
    if product.save
      render json: product.as_json 
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    render json: {message: "Successfully destroyed Product ##{params[:id]}"}
  end
end
