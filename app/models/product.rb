class Product < ApplicationRecord

  def discounted?
    price < 1000
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def as_json
    {
      name: name,
      price: price,
      image_url: image_url,
      description: description,
      discounted: discounted?,
      tax: tax,
      total: total,
      in_stock: in_stock
    }
  end
end
