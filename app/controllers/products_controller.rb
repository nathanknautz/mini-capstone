class ProductsController < ApplicationController

  def products_all_method
    products = Product.all
    render json: products.as_json
  end

end
