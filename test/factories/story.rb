# config: utf-8

FactoryGirl.define do
  factory :story do
    description 'test_description'
    title 'test_title'
    association :owner, factory: :user
    association :performer, factory: :user
  end
end