class Campaign < ApplicationRecord
    has_many :episodes, inverse_of: :campaign
    has_one :game_master, through: :episodes
    accepts_nested_attributes_for :episodes

end
