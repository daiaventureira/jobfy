class ProjectApplicationsController < ApplicationController 
  before_action :authenticate_professional!, only: %i[show create destroy]
  before_action :authenticate_user!, only: %i[accept reject]

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
    if @project_application.save
      flash[:notice] = 'Você se candidatou para fazer parte desse projeto com sucesso!'
      redirect_to @project_application
    else  
      flash[:alert] = "Deve ter introdução"
      render :show
    end
  end

  def edit 
      @project_application = ProjectApplication.find(params[:id])
  end

  def update
    @project_application = ProjectApplication.find(params[:id])
      if @project_application.update(project_application_params)
          redirect_to project_applications_path
      end
  end

  def accept 
    @project_application = ProjectApplication.find(params[:id])
    @project_application.accepted!
    redirect_to project_applications_path, notice: "Você aceitou a proposta!"
  end

  def reject 
    @project_application = ProjectApplication.find(params[:id])
    @project_application.rejected!
    redirect_to project_applications_path, notice: "Você recusou a proposta!"
  end

  def destroy 
    @project_application = ProjectApplication.find(params[:id])
    @project_application.destroy 
    redirect_to project_applications_path, notice: "Você cancelou uma proposta!"
  end

  private 

  def project_application_params 
    params.require(:project_application).permit(:introduction, :reason)
  end
end 
