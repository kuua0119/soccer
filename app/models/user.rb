class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :communities
  has_one_attached :avatar

  def received_comments_count
    posts.joins(:comments).count
  end
  
  def active_for_authentication?
    super && is_active
  end

  def inactive_message
    is_active ? super : :inactive_account
  end
end
