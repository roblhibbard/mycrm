json.extract! part, :id, :name, :description, :cost, :price, :parts_on_order, :parts_in, :date_ordered, :date_received, :created_at, :updated_at
json.url part_url(part, format: :json)