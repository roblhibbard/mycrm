json.extract! labtech_time, :id, :timeslipid, :ticketid, :hours, :mins, :done, :date, :description, :user_id, :labticket_id, :labtech_client_id, :created_at, :updated_at
json.url labtech_time_url(labtech_time, format: :json)
