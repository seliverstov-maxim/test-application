FactoryGirl.define do
  sequence :email do |n|
    "email_#{n}@mail.com"
  end

  sequence :story_title do |n|
    "Story title #{n}"
  end

  sequence :story_description do |n|
    "Story description #{n}"
  end  
end