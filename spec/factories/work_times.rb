# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :work_time do
    user_id 1
    clocked_in_at "2013-12-09 11:07:43"
    clocked_out_at "2013-12-09 11:07:43"
  end
end
