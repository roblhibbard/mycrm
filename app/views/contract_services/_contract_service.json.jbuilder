json.extract! contract_service, :id, :name, :client_id, :computer_id, :service_list_id, :service_type_id, :has_many, :has_many, :created_at, :updated_at
json.url contract_service_url(contract_service, format: :json)