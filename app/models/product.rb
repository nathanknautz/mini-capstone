class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: {greater_than: 0}
  validates :price, presence: true
  validates :description, length: { minimum: 10 }
  validates :description, length: { maximum: 500 }

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
