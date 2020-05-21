class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :lockable, :confirmable
  has_many :posts, dependent: :destroy

  has_many :active_followings, class_name: 'Following', foreign_key: 'follower_id',
  dependent: :destroy
  has_many :passive_followings, class_name: 'Following', foreign_key: 'followed_id',
  dependent: :destroy
  has_many :following, through: :active_followings,  source: :followed
  has_many :followers, through: :passive_followings, source: :follower

  def follow(user)
    active_followings.create(followed_id: user.id)
  end

  def unfollow(user)
    active_followings.find_by(followed_id: user.id).destroy
  end  

  def followes?(user)
    following.include?(user)
  end  

end
