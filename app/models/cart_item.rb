class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :cart_items
end
