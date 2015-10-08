class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  and :omniauthable, :confirmable,
  devise :database_authenticatable, :registerable,  :lockable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable
         
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
         
end
