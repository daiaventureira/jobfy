class ProfessionalsController < ApplicationController
  before_action :authenticate_professional!, only: [:show]

  def show
    @professional = Professional.find(params[:id])
    @profile = Profile.new
  end
end
