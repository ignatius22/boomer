class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_product, only: %i[show edit update destroy]
  before_action :set_user

  def index
    @products = Product.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @product = @user.products.new
  end

  def create
    @product = @user.products.build(product_params)

    if @product.save
      redirect_to user_product_path(@user, @product), notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
  def set_user
    @user = User.find(params[:user_id])
  end
  def product_params
    params.require(:product).permit(:title, :description, :price, :image)
  end
end
