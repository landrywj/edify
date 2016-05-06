class User < ActiveRecord::Base
  # Include default devise modules. Others available are :omniauthable and :confirmable.
  devise :database_authenticatable, :registerable,  :lockable, :timeoutable, :recoverable, :rememberable, :trackable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  enum role: [ :admin, :educator, :guardian, :student ]
end
