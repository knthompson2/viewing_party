class Party < ApplicationRecord
  validates :title, presence: true
  validates :start_time, presence: true
  validates :date, presence: true
  validates :duration, presence: true
  validates :movie_id, presence: true

  belongs_to :user
  has_many :invitees
  has_many :users, through: :invitees
end
