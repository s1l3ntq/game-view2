class Comment < ApplicationRecord
    belongs_to :game
    belongs_to :user

    #accepts_nested_attributes_for :games
end
#, through: :games