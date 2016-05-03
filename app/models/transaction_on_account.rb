require 'filewatcher'
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
 
 # FileWatcher.new(["/Users/user/Documents/My docs/RoR/Projects/inno/xml"]).watch() do |filename, event|
 #    if(event == :changed)
 #      puts "File updated: " + filename
 #    end
 #    if(event == :delete)
 #      puts "File deleted: " + filename
 #    end
 #    if(event == :new)
 #      debugger
 #      puts "Added file: " + filename
 #    end
 # end

end
