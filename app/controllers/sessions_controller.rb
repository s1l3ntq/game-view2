class SessionsController < ApplicationController

    def welcome
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(params[:username])
        if @user && @user.authenticate(params[:password])
            #byebug
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            #byebug
                redirect_to '/login'

        end
    end

    

    def destroy
        session.delete(:user_id)
        redirect_to '/login'
    end






    private
    def user_params
     params.require(:user).permit(:username, :password)
    end 

end