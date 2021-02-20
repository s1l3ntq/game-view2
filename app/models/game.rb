class Game < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :users, through: :comments


    validates :name, presence: true, uniqueness: {scope: :name, message: "is already in use."}
    validates :description, presence: true
    validates :platform, presence: true

    #scope :recent_games, -> { where(:created_at => (Time.now -15.days)..Time.now)}
    #scope :old, -> { where('year_published < ?', 50.years.ago )}


    def self.recent_games
		Game.where(:created_at => (Time.now - 10.days)..Time.now)
	end


    def game_name
        "#{self.name}"
    end

    def new_post_first
        self.all.reverse
    end

end
