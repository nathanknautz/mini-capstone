class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product


  def calculate_subtotal
    quantity * product.price
  end

  def calculate_tax
    subtotal * 0.09
  end

  def calculate_total
    subtotal + tax
  end

end
