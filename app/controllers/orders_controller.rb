class OrdersController < ApplicationController
  def create
    puts "******************"
    puts params[:product_id]
    puts "******************"
    @order = Order.new(user_id: current_user.id,
                      product_id: params[:product_id],
                      quantity: params[:quantity]
                      )
    @order.subtotal = @order.calculate_subtotal
    @order.tax = @order.calculate_tax
    @order.total = @order.calculate_total
    @order.save
    render 'show.json.jbuilder'
    end
  end

