class CommentsController < ApplicationController

    def new
        @comment = Comment.new
        
        
    end

    def create 
    @game = Game.find(params[:id])
    @comment = @game.comments.new(params[:comment]).permit(:comment)
    @comment.user_id = current_user
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



end
