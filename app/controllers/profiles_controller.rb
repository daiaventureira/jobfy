class ProfilesController < ApplicationController
  def index
    @profile = Profile.all 
  end
  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.professional = current_professional
    @profile.save

    redirect_to @profile
  end

  private 

  def profile_params 
    params.require(:profile).permit(:full_name, :social_name, :birth_date, :educational_background, :description, :avatar )
  end
end
