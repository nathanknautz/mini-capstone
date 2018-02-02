class RemoveProductIdandQuantityFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :product_id
    remove_column :orders, :quantity
  end
end
