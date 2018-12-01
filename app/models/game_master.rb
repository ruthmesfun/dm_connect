class GameMaster < ApplicationRecord
    has_many :episodes
    has_many :campaigns, through: :episodes
end
