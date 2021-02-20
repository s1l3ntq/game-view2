module ApplicationHelper

    def current_user
        @current_user ||=  User.find(session[:user_id]) if session[:user_id]
    end
    

    def logged_in?
        !!current_user
    end

    def only_logged_in
        unless logged_in?
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    
    end


end
