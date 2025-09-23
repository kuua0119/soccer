class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :nullify
  has_many :comments, dependent: :nullify
  has_many :communities
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
