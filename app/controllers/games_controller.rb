class GamesController < ApplicationController
    before_action :only_logged_in
def index
    @games = Game.all.reverse
    
end


def show    
    @game = Game.find(params[:id])
    @comment = @game.comments.build
    # @comment = Comment.new
    #@comment = @game.comments
end

def new
    @game = Game.new

end

def create
    
    @game = Game.new(game_params)
    @game.user_id = session[:user_id]
    if @game.save
        redirect_to games_path
        
    else
        flash.now[:messages] = @game.errors.full_messages
        render :new
    end
end

def edit
    if logged_in?
    #@user = self.current_user
    @game = Game.find(params[:id])
    #redirect_to edit_game_path
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
        @game = Game.find(params[:id])
        @game.delete
        redirect_to games_path
    end

    def recent_games
        @recent_games = Game.recent_games
    end

private 

    def game_params
        params.require(:game).permit(:name, :demo, :description, :platform)

    end


    # def upload
    #     uploaded_file = params[:demo]
    #     File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
    #       file.write(uploaded_file.read)
    #     end
    # end
#, :user_id


end