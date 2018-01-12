class CouponsUsedsController < ApplicationController
  def index
    @coupons_useds = CouponsUsed.all
    respond_to do |format|
      # format.html
      format.csv { send_data @coupons_useds.to_csv }
      format.xls 
    end
  end
end
