class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  validates :commentable_id, :commentable_type, :body, presence: true
end
