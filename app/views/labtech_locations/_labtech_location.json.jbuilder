json.extract! labtech_location, :id, :name, :address, :city, :state, :zip, :phone, :fax, :comments, :created_at, :updated_at
json.url labtech_location_url(labtech_location, format: :json)
