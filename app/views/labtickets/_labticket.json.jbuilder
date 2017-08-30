json.extract! labticket, :id, :subject, :created_at, :updated_at
json.url labticket_url(labticket, format: :json)