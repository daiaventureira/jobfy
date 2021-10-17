class UsersController < ApplicationController 
  def index 
    @users = User.all
  end
  def show 
    @users = User.find(params[:id])
    @projects = Project.all
  end
end
