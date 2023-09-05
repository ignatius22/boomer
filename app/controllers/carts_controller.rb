# app/controllers/cart_controller.rb
class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_item, only: [:remove_from_cart]

  def show
    @cart_items = current_user.cart_items
    @total_price = @cart_items.sum(&:subtotal)
  end

  def add_to_cart
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i

    if product && quantity.positive?
      current_user.cart_items.create(product:, quantity:)
      flash[:notice] = 'Product added to cart.'
    else
      flash[:alert] = 'Invalid product or quantity.'
    end

    redirect_to cart_path
  end

  def remove_from_cart
    if @cart_item
      @cart_item.destroy
      flash[:notice] = 'Product removed from cart.'
    else
      flash[:alert] = 'Product not found in your cart.'
    end

    redirect_to cart_path
  end

  private

  def set_cart_item
    @cart_item = current_user.cart_items.find_by(id: params[:id])
  end
end
