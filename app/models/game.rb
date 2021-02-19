class Game < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments


    validates :name, presence: true, uniqueness: {scope: :name, message: "is already in use."}
    validates :description, presence: true
    validates :platform, presence: true

    scope :recent_games, -> { where('created_at' < 30.days.ago)}


    def game_name
        "#{self.name}"
    end

    def new_post_first
        self.all.reverse
    end

end
