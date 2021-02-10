class GamesController < ApplicationController

def index
    @games = Game.all.reverse
    
end


def show    
    @game = Game.find(params[:id])
end

def new
    @game = Game.new
    @game.comments.build

end

def create
    @game = Game.new(game_params)
    byebug
    
    if @game.user_id = session[:user_id]
       @game.save
        redirect_to games_path
        
    else
        render :new
    end
end

def edit
    if logged_in?
    @user = self.current_user
    @game = Game.find(params[:id])
    redirect_to edit_game_path
    end
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
        params.require(:game).permit(:name, :demo, :description, :platform, :user_id)

    end


    # def upload
    #     uploaded_file = params[:demo]
    #     File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
    #       file.write(uploaded_file.read)
    #     end
    # end



end