class TransactionOnAccount < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  after_create :check
  validates :category, presence: true
  validates :value, presence: true
  validates :reason, presence: true
  validates :date, presence: true

  def check
     account.critic 
  end

end
