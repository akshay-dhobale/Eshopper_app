class AddressesController < ApplicationController
  
  def new
    @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    @address.user_id = current_user.id
    @address.save!
    render :back
    # redirect_to addresses_path
  end

  def index
    @address = Address.where(user_id: current_user.id)
  end

  def show
    @address = Address.where(user_id: current_user.id)
  end

  def edit
    @address = Address.find(params[:id])
    binding.pry
  end

  def update
    binding.pry
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to :back
    # redirect_to addresses_path 
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

    def address_params
      params.require(:address).permit(:user_id, :address_1, :address_2, :city, :country, :state, :zipcode)
    end
end
