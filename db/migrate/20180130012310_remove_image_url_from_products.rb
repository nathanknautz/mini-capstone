class RemoveImageUrlFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :image_url
  end
end
