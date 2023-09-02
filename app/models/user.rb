class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts
  has_many :products
  has_one_attached :profile_photo
  has_many :likes
  has_one :cart
  has_many :cart_items, through: :cart

  
  followability

  validates :username, presence: true, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def unfollow(user)
    followerable_relationships.where(followable_id: user.id).destroy_all
  end
end
