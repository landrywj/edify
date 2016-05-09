class Offering < ActiveRecord::Base
  belongs_to :semester
  belongs_to :course
  validates :course_id, :semester_id, presence: true
end
