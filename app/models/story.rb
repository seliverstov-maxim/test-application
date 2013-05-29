class Story < ActiveRecord::Base
  scope :by_owner, ->(user_id) { where(owner_id: user_id) unless (user_id.blank?) }
  scope :by_performer, ->(user_id) { where(performer_id: user_id) unless (user_id.blank?) }
  scope :by_state, ->(user_id) { where(state: state) unless (state.blank?) }
  scope :recent_order, -> { order('created_at desc') }

  attr_accessible :description, :title, :owner_id, :performer_id, :state_event#, :state

  belongs_to :owner, class_name: "User"
  belongs_to :performer, class_name: "User"

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
