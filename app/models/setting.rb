class Setting < ApplicationRecord
    has_many :episodes
    has_many :campaigns, through: :episodes
    has_many :game_masters, through: :episodes
end
