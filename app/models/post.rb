class Post < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
    validates :body, :user_id, presence: true
  has_many :comments, as: :commentable, dependent: :destroy
end
