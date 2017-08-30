json.extract! dispatch, :id, :phone, :details, :ticket, :calendar, :billable_time, :non_billable, :created_at, :updated_at
json.url dispatch_url(dispatch, format: :json)