# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    employee_id "kokenjr"
    first_name "Ken"
    last_name "Orji"
    status "CLOCKED OUT"
    role "EMPLOYEE"
  end
end
