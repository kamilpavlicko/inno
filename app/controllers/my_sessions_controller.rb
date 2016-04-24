class MySessionsController < Devise::SessionsController
  skip_before_filter :check_concurrent_session

  def create
    super
    set_login_token
  end

  private
  def set_login_token
    token = Devise.friendly_token
    session[:token] = token
    current_user.token = token
    current_user.save(validate: false)
  end
end
