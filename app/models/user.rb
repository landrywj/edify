class User < ActiveRecord::Base
  # Include default devise modules. Others available are :registerable, :omniauthable and :confirmable.
  devise :database_authenticatable, :lockable, :timeoutable, :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  enum role: [ :admin, :educator, :guardian, :student ]
end
