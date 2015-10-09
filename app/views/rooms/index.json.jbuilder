json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :subsection, :capacity
  json.url room_url(room, format: :json)
end
