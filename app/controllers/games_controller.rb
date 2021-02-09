class GamesController < ApplicationController

def index
    @games = Game.all.reverse
    
end


def show
    @game = Game.find(params[:id])
end

def new
    @game = Game.new

end

def create
    @game = Game.new(game_params)
    
    if @game.user_id = session[:user_id]
       @game.save
        redirect_to games_path
    else
        render :new
    end
end

def edit
    @game = Game.find(params[:id])
end
def update
    @game = Game.find(params[:id])
    @game.update(game_params)
        if @game.valid?
            redirect_to games_path
        else
            render :edit
        end
    end

    def destroy 
        @game = Game.find(prams[:id])
        @game.delete
        redirect_to games_path
    end

private 

def game_params
    params.require(:game).permit(:name, :demo, :description, :platform)
end



end