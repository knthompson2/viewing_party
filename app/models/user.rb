class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :invitees, dependent: :destroy
  has_many :parties, through: :invitees

  has_secure_password
end
