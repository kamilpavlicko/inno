class AccountsController < ApplicationController
   before_action :authenticate_user!


   def index
     @account = Account.new
     @accounts = current_user.accounts
   end

   def create
     @account = Account.new(param.merge(user_id: current_user.id))
     @account.save 
     redirect_to :back
   end

   def show
    @account = current_user.accounts.find(params[:id]) 
   end

   private
     def param
       params.require(:account).permit(:name, :notifications, :critic_value)
     end

end
