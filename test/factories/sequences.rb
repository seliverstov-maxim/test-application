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

  sequence :comment_message do |n|
    "Comment message #{n}"
  end
end