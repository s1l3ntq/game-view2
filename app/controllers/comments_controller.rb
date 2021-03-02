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
        
    
        @game = Game.find(params[:game_id])
        
        @comment = Comment.new(comments_params)
        @comment.game = @game
       
        @comment.user = current_user
        
        if @comment.save
            
            redirect_to game_comment_path(@game, @comment) 
        else
            render :new
        end
    end

    def show
        @game = Game.find(params[:game_id])
        #@comment = Comment.find(params[:id])
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
       
        params.require(:comment).permit(:comment) 
    end

    # def get_game
    #     @game =Game.find(params[:game_id])
    # end
#, :game_id, :user_id ,game_attributes:[:id]

end