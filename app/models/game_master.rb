class GameMaster < ApplicationRecord
    has_many :episodes, inverse_of: :game_master
    has_many :campaigns, -> {distinct}, through: :episodes

end
