class WishlistsController < ApplicationController

  def index
    if current_user.present?
      @user = current_user.id
      @wishlist_items = Wishlist.all
      @wishlist_user = Wishlist.where(user_id: current_user.id)
    else
      redirect_to user_session_path
    end
  end

  def create
    if current_user.present?
      @product = Product.find(params[:product_id])

      @wishlist = Wishlist.find_by(product_id: @product.id, user_id: current_user.id)
      if !@wishlist.present?
        @wishlist = Wishlist.new(product_id: params[:product_id], user_id: current_user.id )
        @wishlist.save
      end
      respond_to do |format|
        format.js
      end
    else
      redirect_to user_session_path
    end
  end

  def destroy
    @wishlist_item = Wishlist.find(params[:id])
    @wishlist_item.destroy
    redirect_to wishlists_index_path 
  end

end
