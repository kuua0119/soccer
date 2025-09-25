class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :communities, foreign_key: "user_id"  
  has_many :community_users, dependent: :destroy
  has_many :joined_communities, through: :community_users, source: :community
  has_many :community_messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_one_attached :avatar

  def received_comments_count
    posts.joins(:comments).count
  end

  def display_name
    name.presence || "退会済みユーザー"
  end
  
  def active_for_authentication?
    super && is_active
  end

  def inactive_message
    is_active ? super : :inactive_account
  end
end
