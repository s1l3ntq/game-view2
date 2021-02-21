class SessionsController < ApplicationController

    def welcome
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
                session[:user_id] = @user.id 
                redirect_to user_path
        else
                @error = @user.errors.full_messages
                render :signup

        end
    end

    

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    def google
        @user = User.find_or_create_by(username: auth["info"]["name"]) do |user| 
            user.password =  SecureRandom.hex(10)
        end 
        if @user && @user.id
            session[:user_id] = @user.id
            redirect_to games_path 
        else 
            redirect_to "/login"
        end 
    end 




    private
    def user_params
     params.require(:user).permit(:username, :password)
    end 

    def auth
        request.env['omniauth.auth']
    end

end