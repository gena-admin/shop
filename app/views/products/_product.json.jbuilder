json.extract! product, :id, :name, :brand, :model, :sku, :price, :desc, :created_at, :updated_at
json.url product_url(product, format: :json)
