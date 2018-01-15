class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.order(:id)
    respond_to do |format|
      # format.html
      format.csv { send_data @users.to_csv }
      format.xls #{ send_data @users.to_csv(col_sep: "\t") }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.js
      else
        format.html { render :new }
      end
    end
  end

  def update
    @user = current_user
    if @user.email == params[:user][:email]
      respond_to do |format|
        format.html {redirect_to user_enter_email_path(@user.id), notice:'Must enter new email address'}
      end
    else
      respond_to do |format|
        if @user.update(user_params)
          # UserMailer.user_created(@user.deliver_later
          format.html { redirect_to root_path, notice: 'User was successfully updated.' }
        else
          format.html { redirect_to user_enter_email_path(@user.id), notice: 'Email already exist' }
        end
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  def enter_email
    @user = current_user
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email)
    end
end
