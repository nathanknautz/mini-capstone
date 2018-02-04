class OrdersController < ApplicationController
  before_action :authenticate_user
  def index
    @orders = current_user.orders 
    render 'index.json.jbuilder'
  end

  def create
    carted_products = current_user.carted_products.where(status: 'carted')
    subtotal = 0
   
    carted_products.each do |carted_product|
      subtotal += carted_product.quantity * carted_product.product.price
    end

    tax = subtotal * 0.09
    total = subtotal + tax

    @order = Order.new(user_id: current_user.id,
                        subtotal: subtotal,
                        tax: tax,
                        total: total
                      )
    @order.save
    carted_products.each do |carted_product|
      carted_product.status = 'Purchased'
      carted_product.order_id = @order.id
      carted_product.save
    end
    render 'show.json.jbuilder'
    end
  end

