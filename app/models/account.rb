class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transaction_on_account
end
