# config: utf-8

FactoryGirl.define do
  factory :story do
    title :story_title
    description :story_description
    association :owner, factory: :user
    association :performer, factory: :user
  end
end