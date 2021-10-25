class ProjectApplicationsController < ApplicationController 
  helper_method :is_current_professional_id_and_professioanl_signed_in_the_same?

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

  def edit 
      @project_application = ProjectApplication.find(params[:id])
  end

  def update
    @project_application = ProjectApplication.find(params[:id])
      if @project_application.update(project_application_params)
          redirect_to project_applications_path
      else
        render :new
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
