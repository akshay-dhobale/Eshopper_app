class HomeController < ApplicationController
	def index
    	@banner = Banner.all
    	@categories = Category.all
    	# @parents = []
        @brands = Brand.all

    	# @categories.each do |c|
    	# 	@parents.push(c.parent_id)
    	# 	    	# binding.pry
    	# end
        @productcategories = ProductCategory.all
        @products = Product.all
        @productimages = ProductImage.all
  	end
end
