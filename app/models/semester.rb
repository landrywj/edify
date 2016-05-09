class Semester < ActiveRecord::Base
  has_many :offerings
  validates :name, :start_date, :end_date, presence: true
end
