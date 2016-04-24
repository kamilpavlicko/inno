class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_concurrent_session
    if duplicate_session?
      sign_out_and_redirect(current_user)
      flash[:notice] = "Duplicate Login Detected"
    end
  end

  def duplicate_session?
   debugger 
   user_signed_in? && (current_user.token != session[:token])
  end
end
