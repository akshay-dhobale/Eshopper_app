class CartsController < ApplicationController
  # before_action :authenticate_user!

  # session[:product_id] = "asdsadsa"
  def new
    flash[:notice] = "Product was successfully added."
  end

  def index
    # binding.pry
    if current_user.present?
      @user = current_user.id
      @cart_items = Cart.all
      @cart_user = Cart.where(user_id: current_user.id)
      @count = @cart_user.count()
    else
      redirect_to user_session_path
    end
  end

  def create
        session[:product_id] = params["product_id"]
    quantity = 1
    if current_user.present?
      @product = Product.find(params[:product_id])
      @cart = Cart.find_by(product_id: @product.id, user_id: current_user.id)
      if @cart.present?
        @cart.quantity += quantity
      else
        @cart = Cart.create(product_id: params[:product_id], user_id: current_user.id, quantity: quantity)
      end
     
      @cart.save!

      # Count for each user
      if current_user.present?
        @cart_user = Cart.where(user_id: current_user.id)
        @count = @cart_user.count()
      end
      # binding.pry
      # binding.pry
      respond_to do |format|
        format.js
      end
    else
      redirect_to user_session_path
    end
  end

  def show
    # @cart_user = Cart.where(user_id: current_user.id)
    # @count = @cart_user.count()
  end

  def update
    @item = Cart.find(params[:id])
    @item.quantity -= 1
    @item.save
    @quant = @item.quantity
    # binding.pry
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @cart_item = Cart.find(params[:id])
    @cart_item.destroy
    redirect_to carts_index_path notice: 'Cart item was successfully updated.'
  end

  private
  def cart_params
    params.require(:carts).permit(:quantity, :product_id, :user_id)
  end
end
