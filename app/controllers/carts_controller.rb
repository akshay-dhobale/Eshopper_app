class CartsController < ApplicationController
  include CartsHelper

  def new
    @cart = Cart.new
  end

  def index
    if current_user.present?
      b =  session.keys 
      @p = b.map(&:to_i)
      
      @p.each do |product_id|
        if product_id != 0
          @cart = Cart.find_by(product_id: product_id, user_id: current_user.id)
          if @cart.present?
            @cart.quantity += 1
          else
            @cart = Cart.create(product_id: product_id, user_id: current_user.id, quantity: session[product_id.to_s])
          end
          @cart.save!
          session.delete(product_id.to_s)
        end
      end
      @total = cost_user_cart
    # for items in session cart
    else
      @total = cost_session_cart
      @shipping_cost = 4
    end
  end

  def create
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
      @count = current_user.carts.count()

      respond_to do |format|
        format.js{flash[:notice] = "Product Added To Cart"}
      end
     # for items in session cart
    else
      quantity = 1
      @product = Product.find(params[:product_id])
      product_id = @product.id
      if session[product_id].present?
        session[product_id.to_s] += quantity 
      else
        session[product_id] ||= {}
        session[product_id] = quantity
      end
      flash[:notice] = "Product added to cart"
    end
  end

  def show
    
  end

  def update
    if current_user.present?
      @item = Cart.find(params[:id])
      if @item.quantity > 0
        if params[:value] == "-1"
          if @item.quantity != 1
            @item.quantity -= 1
          end
        elsif params[:value] == "1"
          @item.quantity += 1
        end
          @item.save
      end

      @total = cost_user_cart()
      respond_to do |format|
        format.js 
      end
     # for items in session cart
    else 
      quantity = 1
      if params[:value] == "-1"
        session[params[:id]] -= quantity 
      elsif params[:value] == "1"
        session[params[:id]] += quantity 
      end
      @this_product = Product.find(params[:id])
      @shipping_cost = 4
      @total = cost_session_cart()
    end
  end

  def destroy
    if current_user.present?
      @cart_item = Cart.find(params[:id])
      @cart_item.destroy
      respond_to do |format|
        format.html{redirect_to carts_index_path, notice: 'Cart product is successfully removed.'}
      end
     # for items in session cart
    else
      session[params[:id]] = nil
      redirect_to carts_index_path, notice: 'Cart product is successfully removed.'
    end
  end

  def add_coupon
    if params[:commit] == "remove"
      session[:coupon_id] = nil
    else
      @coupon = Coupon.find_by(code: params[:code])
      @discount = @coupon.percent_off
      session[:coupon_id] = @coupon.id
    end
    if current_user.present?
      @total = cost_user_cart
    else
      @total = cost_session_cart
    end
    @shipping_cost = 4
    respond_to do |format|
      format.js
    end
  end

  private
  def cart_params
    params.require(:carts).permit(:quantity, :product_id, :user_id, :code)
  end
end

 


