class ProductRatingsController < ApplicationController
  
  def create
    # binding.pry
    @product_rating = ProductRating.find_by(product_id: params[:product_id], user_id: current_user.id)
    if !@product_rating.present?
      @product_rating = ProductRating.create(product_id: params[:product_id], rating:params[:rating],comment:params[:comment], user_id:current_user.id)
    end
    redirect_to products_show_path(id:params[:product_id])
  end

  def index
    binding.pry
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def product_rating_params
      params.require(:product_rating).permit(:product_id, :rating, :user_id, :comment)
    end
end
