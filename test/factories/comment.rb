# config: utf-8

FactoryGirl.define do
  factory :comment do
    association :owner, factory: :user
    association :story

    message { generate :comment_message}
  end
end
