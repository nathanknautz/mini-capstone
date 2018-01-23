class ChangeInStockInProducts < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :in_stock, :boolean
  end
end
