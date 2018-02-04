json.id order.id
json.carted_products order.carted_products.each do |carted_product|
  json.id carted_product.id
  json.user_id carted_product.user_id
  json.status carted_product.status
  json.quantity carted_product.quantity
  json.product carted_product.product
end
json.subtotal order.subtotal
json.tax order.tax
json.total order.total