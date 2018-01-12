class ContactUsController < ApplicationController
  def new
  @contact_message = ContactU.new
  end

  def create
  @contact_message = ContactU.create(contact_u_params)
  redirect_to root_path
  end

  private
  def contact_u_params
    params.require(:contact_u).permit(:name, :email, :contact_no, :message, :note_admin)
  end
end
