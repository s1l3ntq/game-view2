class CommentsController < ApplicationController

    def new
        @game =Game.find(params[:game_id])
        @comment = @game.comments.build
        #(game_id:@game.id) associates right away.
    end
    

    def create
        @game = Game.find(params[:game_id]) 
        @comment = @game.comments.build(comments_params)
        #@comment = Comment.new(params[:comment])
        #@comment.user_id = session[user_id]
        #@comment.game_id = params[:game_id]
        if @comment.save
            redirect_to game_comment_path(params[:game_id],@comment)
            
    # @game = Game.find(params[:id])
    # @comment = @game.comments.new(params[:comment]).permit(:comment)
    # @comment.user_id = current_user
    # if @comment.save
    # redirect_to game_path(@game)
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

    def comments_params
        params.require(:comment).permit(:comment)   
    end


end
