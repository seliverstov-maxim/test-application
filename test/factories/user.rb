# coding: utf-8

FactoryGirl.define do
  factory :user do
    email
    password 'secret'
  end
end