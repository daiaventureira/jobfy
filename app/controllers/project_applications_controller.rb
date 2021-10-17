class ProjectApplicationsController < ApplicationController 
  def index 
    @project_application = ProjectApplication.all
  end
  def show 
    @project_application = ProjectApplication.find(params[:id])
  end
  
  def create 
    @project_application = current_professional.project_applications.new(project_application_params)

    # @project_application = ProjectApplication.new(project_application_params)
    # @project_application.professional = current_professional
    @project_application.project = Project.find(params[:project_id])
    @project_application.save
    flash[:notice] = 'Você se candidatou para fazer parte desse projeto com sucesso!'
    redirect_to @project_application
  end

  private 

  def project_application_params 
    params.require(:project_application).permit(:introduction)
  end
end 
