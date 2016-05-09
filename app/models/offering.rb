class Offering < ActiveRecord::Base
  belongs_to :semester
  belongs_to :course
end
