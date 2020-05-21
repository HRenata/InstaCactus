class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :lockable, :confirmable
  has_many :posts, dependent: :destroy

  has_many :active_following, class_name: 'Following', foreign_key: 'follower_id',
  dependent: :destroy
  has_many :passive_following, class_name: 'Following', foreign_key: 'followed_id',
  dependent: :destroy
  has_many :following, through: :active_following,  source: :followed
  has_many :followers, through: :passive_following, source: :follower

  def follow(user)
    active_following.create(followed_id: user.id)
  end

  def unfollow(user)
    active_following.find_by(followed_id: user.id).destroy
  end  

  def following?(user)
    following.include?(user)
  end  

end
