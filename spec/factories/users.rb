# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    employee_id "MyString"
    first_name "MyString"
    last_name "MyString"
    status "MyString"
    role "MyString"
  end
end
