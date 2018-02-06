class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculate_subtotal
    sum = 0 
    carted_products.each do |carted_product|
      sum += carted_product.subtotal
    end
    self.subtotal = sum
  end

end
