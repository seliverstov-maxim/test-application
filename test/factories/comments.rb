# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    owner_id 1
    story_id 1
    message "MyString"
  end
end
