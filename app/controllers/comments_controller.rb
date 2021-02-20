class CommentsController < ApplicationController
    # before_action :get_game

    def new
        @game =Game.find(params[:game_id])
        @comment = @game.comments.build
        #(game_id:@game.id) associates right away.
    end
    
    
    def create
        @user = User.find_by_id(comment_params[:id])
        byebug
        @comment = Comment.new(comment_params)
        #@comment = @game.comments.build(comments_params)
        if @comment.valid?
            @comment.save
            redirect_to game_path(@comment.game_id) #params[:game_id],@comment
            # @game = Game.find(comments_params[:game_id]) 
            #@comment.user_id = session[user_id]
            #@comment.game_id = params[:game_id]
            
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
        params.require(:comment).permit(:comment, :game_id, user_id, game_attributes:[:id]) 
    end

    # def get_game
    #     @game =Game.find(params[:game_id])
    # end


end