class Friend < ApplicationRecord

  belongs_to :requested_by, class_name: 'User'

  enum status: [:pending, :accepted, :declined, :blocked]

  validates :friend, presence: true

  def self.friend_requested(user)
    where(friend: user, status: :pending).count
  end

end
