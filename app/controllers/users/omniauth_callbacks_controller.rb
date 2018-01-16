class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
  # protect_from_forgery :except => :create

  def twitter
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      if "#{request.env["omniauth.auth"].uid}@home.com" == @user.email
        sign_in @user, event: :authentication
        redirect_to user_enter_email_path(@user.id)
      else
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Twitter") if is_navigational_format?
      end
    else
      session["devise.twitter_data"] = request.env["omniauth.auth"].select { |k, v| k == "email" }
      respond_to do |format|
        format.html { redirect_to new_user_session_path, notice: "Not gettting all required data" }
      end
    end
  end


  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      if "#{request.env["omniauth.auth"].uid}@home.com" == @user.email
        sign_in @user, event: :authentication
        redirect_to user_enter_email_path(@user.id)
      else
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      end
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])

    if @user.persisted?
      if "#{request.env["omniauth.auth"].uid}@home.com" == @user.email
        sign_in @user, event: :authentication
        redirect_to user_enter_email_path(@user.id)
      else
        flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
        sign_in_and_redirect @user, event: :authentication
      end
    else
      session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) # Removing extra as it can overflow some session stores
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end

  def failure
    redirect_to root_path
  end

end