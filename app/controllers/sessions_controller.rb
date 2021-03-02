class SessionsController < ApplicationController

    def welcome
    end

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(user_params)
        if !@user.authenticate(params[:password])
            @error =  "Password was Incorrect"
            
           
        elsif @user.save
             session[:user_id] = @user.id 
            redirect_to user_path(@user)
             render :new
        else
                @error = @user.errors.full_messages
                render :signup

        end
    end


    # def create
    #     user = User.find_by(username: params[:username])
    #     user = user.try(:authenticate, params[:password])
    #     if user
    #         session[:user_id] = user.id
    #         redirect_to root_path
    #     else
    #         flash.now[:error] = ["There was a problem logging in. Please make sure you use the correct username & password."]
    #         render :new
    #     end
    # end


    

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