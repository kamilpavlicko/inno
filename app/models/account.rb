class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transaction_on_account

 def critic
    debugger
   if ((transaction_on_account.sum(:value) < critic_value) and notifications)
      # debugger  
      # NotifyMailer.sample_email(user).deliver
   end
 end 
  
end
