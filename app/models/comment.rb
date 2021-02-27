class Comment < ApplicationRecord

  belongs_to :created_by, class_name: 'User'
  belongs_to :commentable, polymorphic: true

  enum published: [ :pending, :published ]

end
