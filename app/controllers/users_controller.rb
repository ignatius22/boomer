class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
        @posts = current_user.posts
    end

   def index
    @users = User.all
   end
   
    
end
