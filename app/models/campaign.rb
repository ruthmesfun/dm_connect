class Campaign < ApplicationRecord
    has_many :episodes
    has_one :game_master, through: :episodes
    has_many :settings, through: :episodes
end
