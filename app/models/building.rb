class Building < ActiveRecord::Base
  validates :name, presence: true
end
