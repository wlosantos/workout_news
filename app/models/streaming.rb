class Streaming < ApplicationRecord

  belongs_to :created_by, class_name: 'User'
  has_many :comments, as: :commentable

  enum published: [ :pending, :published ]
end
