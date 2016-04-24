class TransactionOnAccount < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  after_create :check

  def check
     account.critic 
  end

end
