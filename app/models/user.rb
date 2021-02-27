class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: :created_by_id, dependent: :destroy
  has_many :friends, foreign_key: :requested_by_id, dependent: :destroy
  has_many :streamings, foreign_key: :created_by_id, dependent: :destroy
  has_many :comments, foreign_key: :created_by_id, dependent: :destroy
  has_one_attached :avatar

  enum kind: [:user, :admin, :maneger]
  enum status: [:active, :inactive]

  validates :name, presence: true
  validates :username, uniqueness: true

  # TODO: Adicionar method para retirar espaços do username

  def friend_by?(amigo)
    friends.where(friend: amigo).exists?
  end

  private


end
