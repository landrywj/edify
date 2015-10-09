json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :middle_name, :last_name, :nickname, :dob, :ssn, :gender, :grade, :ethnicity, :home_address
  json.url student_url(student, format: :json)
end
