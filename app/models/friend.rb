class Friend < ApplicationRecord

  belongs_to :requested_by, class_name: 'User'

  enum status: [:pending, :accepted, :declined, :blocked]

  validates :friend, presence: true

end
