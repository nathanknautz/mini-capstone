class Product < ApplicationRecord
  belongs_to :supplier
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
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

end
