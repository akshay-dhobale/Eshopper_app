class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_admin_user!
  # GET /admin_users
  # GET /admin_users.json
  def index
    @users = User.all
  end

  # GET /admin_users/1
  # GET /admin_users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /admin_users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  # POST /users.json
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

  # PATCH/PUT /admin_users/1
  # PATCH/PUT /admin_users/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to edit_user_path(id: current_user), notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin_users/1
  # DELETE /admin_users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstname, :lastname)
    end
end
