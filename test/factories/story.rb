# config: utf-8

FactoryGirl.define do
  factory :story do
    title { generate :story_title }
    description { generate :story_description }
    association :owner, factory: :user
    association :performer, factory: :user
  end
end