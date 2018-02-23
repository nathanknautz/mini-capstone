class ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  
  def index
    @products = Product.all
    search_term = params[:search]
    sort_by = params[:sort]
    if search_term
      @products = @products.where("name iLIKE ?", 
                                "%#{search_term}%")
    end
    if sort_by
      @products = @products.order("#{sort_by}")
    end
    category_name = params[:category]
    if category_name
      @products = Category.find_by(name: category_name).products
    end
    render 'index.json.jbuilder'
  end

  def create
    @product = Product.new(name: params[:name],
                          price: params[:price],
                          description: params[:description],
                          supplier_id: params[:supplier_id])
    if @product.save 
      render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end

  end

  def show
    @product = Product.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
     @product = Product.find(params[:id])
     @product.name = params[:name] || @product.name 
     @product.price = params[:price] || @product.price
     @product.description = params[:description] || @product.description
     @product.in_stock = params[:in_stock] || @product.in_stock
     @product.supplier_id = params[:supplier_id] || @product.supplier_id
    
    if @product.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      render json: {message: "Successfully destroyed Product ##{params[:id]}"}
    else
      render json: {errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
