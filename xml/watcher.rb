require 'filewatcher'
require 'nokogiri'
require 'sqlite3'

require 'rubygems'
require 'active_record'

class TransactionOnAccount < ActiveRecord::Base
end

class Category < ActiveRecord::Base
end

class User < ActiveRecord::Base
end

class Account < ActiveRecord::Base
end

ActiveRecord::Base.establish_connection(
                                        :adapter => "sqlite3",
                                        :host => "localhost",
                                        :database => "../db/development.sqlite3",
                                        :pool => 5
                                        )

def insert_to_db(category,user_email,account_name,value,reason,datetime)
   
   user = User.find_by(email: user_email)
   return "failed" if user.nil?
   
   account = Account.find_by(user_id: user.id, name: account_name)
   return "failed" if account.nil?
   
   cat = Category.find_by(name: category)
   if cat.nil?
      cat = Category.new(name: category) if cat.nil?
      cat.save
   end
   
   transaction = TransactionOnAccount.new(value: value, reason: reason, date: datetime, category_id: cat.id, account_id: account.id)
   transaction.save
   
   return "OK"
   
end

def proccess_file(filename)
 doc = File.open(filename) { |f| Nokogiri::XML(f) }
 category = doc.at_xpath("transaction/category").content
 user_email = doc.at_xpath("transaction/user").content
 account = doc.at_xpath("transaction/account").content
 value = doc.at_xpath("transaction/value").content
 reason = doc.at_xpath("transaction/reason").content
 datetime = doc.at_xpath("transaction/datetime").content
 result = insert_to_db(category,user_email,account,value,reason,datetime)
 
 builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
     xml.result {
             xml.transaction {
                 xml.id filename
                 xml.status result
             }
     }
 end
 puts builder.to_xml
 
end


FileWatcher.new(["/Users/user/Documents/My docs/RoR/Projects/inno/xml"]).watch() do |filename, event|
     if(event == :new)
       puts "Added file: " + filename
       proccess_file(filename)
     end
end

