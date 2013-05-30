class Comment < ActiveRecord::Base
  attr_accessible :message, :owner_id, :story_id

  belongs_to :owner, class_name: "User"
  belongs_to :story
end
