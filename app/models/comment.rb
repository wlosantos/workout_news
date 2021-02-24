class Comment < ApplicationRecord

  belongs_to :commentable, polymorphic: true

  enum published: [ :pending, :published ]
end
