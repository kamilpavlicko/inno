FactoryGirl.define do
  factory :transaction do
    account nil
    category nil
    value 1.5
    reason "MyString"
    date "2016-04-23 18:12:46"
  end
end
