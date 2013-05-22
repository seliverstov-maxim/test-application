FactoryGirl.define do
  sequence :email do |n|
    "email_#{n}@mail.com"
  end
end