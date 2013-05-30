# config: utf-8

FactoryGirl.define do
  factory :comment do
    association :owner, factory: :user
    association :story, factory: :story

    message { generate :comment_message}
  end
end
