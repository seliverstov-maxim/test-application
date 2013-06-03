class Story < ActiveRecord::Base
  
  attr_accessible :description, :title, :owner_id, :performer_id, :state_event#, :state

  belongs_to :owner, class_name: "User"
  belongs_to :performer, class_name: "User"

  has_many :comments, dependent: :destroy, class_name: "Comment"

  validates :owner, presence: true

  state_machine :state, initial: :new do
    event :start do
      transition [:new, :rejected] => :started, if: lambda { |task| task.has_owner? }
    end
    event :finish do
      transition :started => :finished
    end

    event :accept do
      transition :finished => :accepted
    end

    event :reject do
      transition :finished => :rejected
    end
  end

  def has_owner?
    owner_id?
  end
end
