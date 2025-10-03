class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :communities, foreign_key: "user_id", dependent: :nullify
  has_many :community_users, dependent: :destroy
  has_many :joined_communities, through: :community_users, source: :community
  has_many :community_messages, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: :post
  has_many :active_relationships, class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries
  has_many :direct_messages, dependent: :destroy

  has_one_attached :avatar

  def received_comments_count
    posts.joins(:comments).count
  end

  def display_name
    name.presence || "退会済みユーザー"
  end

  def display_avatar
    if name.blank? 
      "profile.jpg"
    elsif avatar.attached?
      avatar
    else
      "profile.jpg"
    end
  end
  
  def active_for_authentication?
    super && !is_banned
  end

  def inactive_message
    if is_banned
      :banned
    elsif !is_active?
      :inactive
    else
      super
    end
  end

  def follow(user)
    following << user unless self == user
  end

  def unfollow(user)
    following.delete(user)
  end

  def following?(user)
    following.include?(user)
  end

  def banned?
    is_banned
  end

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end

    def guest?
    email == "guest@example.com"
  end
end
