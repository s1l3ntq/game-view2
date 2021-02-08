class UsersController < ApplicationController
    def new_user
        @user = User.new(params)
    end
   private
   def user_params
   end 
end