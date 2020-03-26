class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable,
        :lockable, :confirmable
end
