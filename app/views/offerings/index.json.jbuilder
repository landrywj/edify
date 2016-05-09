json.array!(@offerings) do |offering|
  json.extract! offering, :id, :semester_id, :course_id, :credits, :format, :building_id, :room_id
  json.url offering_url(offering, format: :json)
end
