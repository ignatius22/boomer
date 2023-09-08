class Product < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :orders
  has_many :carts, through: :orders

  has_one_attached :image
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
