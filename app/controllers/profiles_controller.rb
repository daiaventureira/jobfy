class ProfilesController < ApplicationController  
  before_action :authenticate_professional!, only: %i[show create update]
  
  helper_method :is_current_professional_profile?

  def show
    @profile = Profile.find(params[:id])
  end
 
  def create
    @profile = Profile.new(profile_params)
    @profile.professional = current_professional
    if  @profile.save
      redirect_to root_path
    else 
      render :new
    end
  end

  def update
    @profile = Profile.find(params[:id])
      if @profile.update(profile_params)
        redirect_to root_path
      else
        render :show
      end
  end

  private 

  def profile_params 
    params.require(:profile).permit(:full_name, :social_name, :birth_date, :educational_background, :description, :experience )
  end
end
