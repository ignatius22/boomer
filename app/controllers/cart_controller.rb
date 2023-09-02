class CartController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart_items = current_user.cart_items
    @total_price = @cart_items.sum(&:subtotal)
  end

  def remove_from_cart
    cart_item = current_user.cart_items.find_by(id: params[:id])
    if cart_item
      cart_item.destroy
      flash[:notice] = 'Product removed from cart.'
    end
    redirect_to cart_path
  end
end
