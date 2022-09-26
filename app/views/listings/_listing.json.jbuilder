json.extract! listing, :id, :name, :price, :address, :pin_code, :phone, :description, :category_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
