class Episode < ApplicationRecord
  belongs_to :game_master
  belongs_to :campaign
end
