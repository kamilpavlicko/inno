class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transaction_on_account

  validates :name, presence: true
  validates :critic_value, presence: true
  validates :notifications, presence: true
 
 def critic
   if ((transaction_on_account.sum(:value) < critic_value) and notifications)
      # debugger  
       NotifyMailer.sample_email(user).deliver
   end
 end 
  
end
