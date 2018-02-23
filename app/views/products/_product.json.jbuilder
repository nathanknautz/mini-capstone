json.id product.id
json.name product.name
json.description product.description
json.images product.images
json.discounted product.discounted?
json.price product.price 
json.tax product.tax 
json.total product.total 
json.formatted do 
                json.formatted_price number_to_currency(product.price)
                json.tax number_to_currency(product.tax)
                json.total number_to_currency(product.total)

               end
json.in_stock product.in_stock
json.supplier_id product.supplier_id


