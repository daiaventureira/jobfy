class ProjectApplicationsController < ApplicationController 
  def index 
    @project_application = ProjectApplication.all
  end

  def show 
    @project_application = ProjectApplication.find(params[:id])
    @project_application_show = ProjectApplication.where(professional_id: current_professional)
  end
  
  def create 
    @project_application = current_professional.project_applications.new(project_application_params)
    @project_application.project = Project.find(params[:project_id])
    @project_application.save
    flash[:notice] = 'Você se candidatou para fazer parte desse projeto com sucesso!'
    redirect_to @project_application
  end

  def accept 
    @project_application = ProjectApplication.find(params[:id])
    @project_application.accepted!
    redirect_to @project_application.project
  end
  def reject 
    @project_application = ProjectApplication.find(params[:id])
    @project_application.rejected!
    redirect_to @project_application.project
  end

  private 

  def project_application_params 
    params.require(:project_application).permit(:introduction)
  end
end 
