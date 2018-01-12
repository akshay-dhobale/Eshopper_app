class ApplicationController < ActionController::Base
 
  protect_from_forgery with: :exception
  rescue_from ::ActionController::RoutingError, with: :render_not_found
  
  def new_session_path(scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def render_not_found(exception)
  	binding.pry
  	respond_to do |f| 
      f.html{ render :template => "404", :status => 404 }
    end
  end
end
