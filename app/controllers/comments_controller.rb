class CommentsController < ApplicationController
    before_action :only_logged_in

    def index
        @comments = Comments.all
    end

    def new
        @game =Game.find(params[:game_id])
        @comment = @game.comments.build
        #(game_id:@game.id) associates right away.
    end
    
    
    def create
        @comment = Comment.new(comments_params)
        @comment.user = current_user
        @comment.valid?
        #raise @comment.errors.inspect
        if @comment.valid?
            @comment.save
            redirect_to game_comment_path #params[:game_id],@comment #game_path(@comment.game_id)
            #@user = User.find_by_id(comment_params[:id])
            #@comment = @game.comments.build(comments_params)
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
            #redirect_to game_path(@comment.game_id)
        end
    end

    def show
        @game = Game.find(params[:id])
        @comment = @comment.games.build
    end

    def edit

    end
    def update

    end

    def destroy

        @comment = Comment.find(params[:id])
        @game = @comment.game
        @comment.delete
        redirect_to game_path(@game)

    end
    private

    def comments_params
        params.require(:comment).permit(:comment, :game_id, :user_id ,game_attributes:[:id]) 
    end

    # def get_game
    #     @game =Game.find(params[:game_id])
    # end


end