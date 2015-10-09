json.array!(@courses) do |course|
  json.extract! course, :id, :reference_number, :title, :description
  json.url course_url(course, format: :json)
end
