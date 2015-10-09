json.array!(@educators) do |educator|
  json.extract! educator, :id, :title, :first_name, :last_name, :job_title, :summary, :dob, :ssn, :gender, :ethnicity
  json.url educator_url(educator, format: :json)
end
