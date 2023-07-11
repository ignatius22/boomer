class HomeController < ApplicationController
    before_action :authenticate_user!

    def index
        @welcome = "Welcome to the Home Page"
    end
    
end
