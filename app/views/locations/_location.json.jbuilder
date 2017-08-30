json.extract! location, :id, :name, :address1, :address2, :city, :state, :zip, :phone, :contact, :email, :created_at, :updated_at
json.url location_url(location, format: :json)