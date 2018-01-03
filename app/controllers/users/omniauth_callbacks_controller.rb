class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  # protect_from_forgery :except => :create

  def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    # binding.pry
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].select { |k, v| k == "email" }
      respond_to do |format|
        format.html { redirect_to new_user_session_path, notice: "Not gettting all required data" }
      end
      
    end
  end

  def failure
    redirect_to root_path
  end

end