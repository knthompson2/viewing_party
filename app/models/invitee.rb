class Invitee < ApplicationRecord
  belongs_to :user
  belongs_to :party
end
