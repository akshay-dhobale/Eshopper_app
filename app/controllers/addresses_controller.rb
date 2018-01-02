class AddressesController < ApplicationController
  
  def new
    @flag = params[:flag]
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    @address.user_id = current_user.id
    # @flag = params[:flag]
    @address.save!
    # render :back
    if params[:flag] == "checkout"
      redirect_to checkouts_payment_review_path(address_id: @address.id)
    else
      redirect_to addresses_path
    end
    # redirect_to addresses_path
  end

  def index
    @address = Address.where(user_id: current_user.id)
  end

  def show
    @address = Address.where(user_id: current_user.id)
  end

  def edit
    @flag = params[:flag]
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    if params[:flag] == "checkout"
      redirect_to checkouts_payment_review_path(address_id: @address.id)
    else
      redirect_to addresses_path
    end
    # redirect_to checkouts_payment_review_path(address_id: @address.id)
    # redirect_to addresses_path 
  end

  def destroy
    @address = Address.find(params[:id])
    @flag = params[:flag]
    @address.destroy
    if @flag.present?
      redirect_to checkouts_address_select_path(user_id: current_user.id)
    else
      redirect_to addresses_path
    end
  end

  private

    def address_params
      params.require(:address).permit(:user_id, :address_1, :address_2, :city, :country, :state, :zipcode, :flag)
    end
end
