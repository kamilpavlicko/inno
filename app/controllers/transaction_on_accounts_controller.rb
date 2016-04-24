class TransactionOnAccountsController < ApplicationController
   
  def index
  end

  def new
  end

  def show
  end

  def create
	cat = Category.find_by(name: params[:transaction_on_account][:category])
        if cat.nil?
           cat = Category.new(name: params[:transaction_on_account][:category]) if cat.nil?
           cat.save 
        end
         
        @actual_transaction = TransactionOnAccount.new(params_t.merge(account_id: params[:account_id], category: cat))
	@actual_transaction.save

        redirect_to @account = current_user.accounts.find(params[:account_id])        

  end

  private
   
   def params_t
    params.require(:transaction_on_account).permit(:value, :reason, :date, :category)
  end
end
