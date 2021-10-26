class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
 
  def show 
    @users = User.find(params[:id])
    @projects = Project.all
  end
end
