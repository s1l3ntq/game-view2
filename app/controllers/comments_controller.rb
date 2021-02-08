class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create 
    @game = Game.find(params[:id])
    @comment = @game.comments.new(params[:comment]).permit(:username, :comment)
    if @comment.save
    redirect_to game_path(@game)
    else
        render :new
    end


end

def edit

end
def update

end

def destroy

end

private

def current_user
    @current_user ||=  User.find(session[:user_id])
end

end
