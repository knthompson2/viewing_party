class Party < ApplicationRecord
  validates :title, presence: true
  validates :start_time, presence: true
  validates :date, presence: true
  validates :duration, presence: true
  validates :movie_id, presence: true
end
