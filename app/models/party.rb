class Party < ApplicationRecord
  validates :title, presence: true
  validates :start_time, presence: true
  validates :date, presence: true
  validates :duration, presence: true
  validates :movie_id, presence: true

  has_many :invitees
  has_many :users, through: :invitees

  def find_host(user_id)
    User.find(user_id)
  end
end
