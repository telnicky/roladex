json.array!(@locations) do |location|
  json.extract! location, :id, :address, :city, :state, :zip, :county_code, :phone, :employees, :employee_code, :naics, :ownership, :company_id
  json.url location_url(location, format: :json)
end
