json.id @product.id
json.name @product.name
json.price @product.price 
json.formatted_price number_to_currency(@product.price)
json.image_url @product.image_url
json.description @product.description
json.discounted @product.discounted?
json.tax @product.tax 
json.total @product.total
json.in_stock @product.in_stock
json.supplier_name @product.supplier.name

