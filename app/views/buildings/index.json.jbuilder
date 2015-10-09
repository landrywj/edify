json.array!(@buildings) do |building|
  json.extract! building, :id, :name, :description, :latitude, :longitude
  json.url building_url(building, format: :json)
end
