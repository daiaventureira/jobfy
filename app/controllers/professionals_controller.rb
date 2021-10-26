class ProfessionalsController < ApplicationController
  before_action :authenticate_professional!, only: [:show]

  def show
    @professional = Professional.find(params[:id])
    @profile = Profile.new
  end

  # def new
  #   @professional = Professional.new
  # end

  # def create
  #   @professional = Professional.new(profissional_params)
  #   if @professional.save
  #     redirect_to @professional
  #   else
  #     render :new
  #   end
  # end

  # private 

  # def profissional_params
  #   params.require(:professional).permit(:email, :password) 
  # end
end
