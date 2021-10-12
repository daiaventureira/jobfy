class HomeController < ApplicationController 
    def index  
        @projects = Project.all
    end
    def show 
       @projects = Project.find(params[:id])
    end
end
