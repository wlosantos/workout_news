class Post < ApplicationRecord

  belongs_to :created_by, class_name: 'User'
  has_many :comments, as: :commentable

  has_one_attached :image
  has_rich_text :body

  acts_as_taggable_on :tags

  enum published: [ :pending, :published ]

  validates :title, :body, presence: true

  scope :published, -> {where(published: :published) }
  scope :pending, -> { where(published: :pending) }
  scope :datePublished, -> { order(published: :asc, created_at: :desc) }

end
