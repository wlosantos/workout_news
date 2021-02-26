class Streaming < ApplicationRecord

  belongs_to :created_by, class_name: 'User'
  has_many :comments, as: :commentable, dependent: :destroy

  has_one_attached :video
  has_one_attached :tumbnail
  has_rich_text :description

  enum published: [ :pending, :published ]
end
