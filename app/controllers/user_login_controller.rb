class UserLoginController < ApplicationController
  def index
     @user_logins = current_user.logins
  end
end
