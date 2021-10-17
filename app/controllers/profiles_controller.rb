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

    redirect_to root_path
  end

  def update
    @profile = Profile.find(params[:id])
      if @profile.update(profile_params)
        if @profile.avatar.present?
            @profile.avatar.attach(@profile.avatar.blob)
        end
        redirect_to root_path
      else
        render :new
      end
  end


  private 

  def profile_params 
    params.require(:profile).permit(:full_name, :social_name, :birth_date, :educational_background, :description, :avatar )
  end
end
