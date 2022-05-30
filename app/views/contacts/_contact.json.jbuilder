json.extract! contact, :id, :last_name, :first_name, :phone, :name, :description, :del_status, :active_status, :locality_code, :assigned_code, :created_at, :updated_at
json.url contact_url(contact, format: :json)
