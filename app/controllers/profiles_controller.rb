class ProfilesController < ApplicationController
  # def index
  #   @profile = Profile.all 
  # end

  def show
    @profile = Profile.find(params[:id])
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.professional = current_professional
    if  @profile.save
      redirect_to root_path
    else 
      flash[:alert] = 'Verifique se os campos estão devidamente preenchidos'
      redirect_to @profile.professional
    end
  end

  def update
    @profile = Profile.find(params[:id])
      if @profile.update(profile_params)
        redirect_to root_path
      else
        flash[:alert] = "Verifique se os campos atualizados estão devidamente preenchidos"
        render :show
      end
  end

  private 

  def profile_params 
    params.require(:profile).permit(:full_name, :social_name, :birth_date, :educational_background, :description, :experience )
  end
end
