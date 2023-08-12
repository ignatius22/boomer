class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_one_attached :profile_photo

  validates :username, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
