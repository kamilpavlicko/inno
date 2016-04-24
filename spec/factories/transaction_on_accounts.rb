FactoryGirl.define do
  factory :transaction_on_account do
    account nil
    category nil
    value 1.5
    reason "MyString"
    date "2016-04-23 18:24:23"
  end
end
