class ProjectApplicationsController < ApplicationController 
  before_action :authenticate_professional!, only: %i[show create destroy update]
  before_action :authenticate_user!, only: %i[accept reject] 
  before_action :authenticate, only: %i[index]
  before_action :professional_profile_exists

  helper_method :is_current_professional_signed_in
  helper_method :is_current_user_signed_in

  def index 
    @project_application = ProjectApplication.all
  end

  def show 
    @project_application = ProjectApplication.find(params[:id])
    @project_application_show = ProjectApplication.where(professional_id: current_professional)
  end
  
  def create 
    if current_professional.project_applications.exists?(id: params[:project_id])
      flash[:alert] = "Já existe"
      redirect_to @project_application.project
    else 
      @project_application = current_professional.project_applications.new(project_application_params)
      @project_application.project = Project.find(params[:project_id]) 
      if @project_application.project.closed?
        flash[:alert] = "Esse projeto está fechado!"
        redirect_to @project_application.project
      elsif @project_application.save
        flash[:notice] = 'Você se candidatou para fazer parte desse projeto com sucesso!'
        redirect_to @project_application
      else  
        flash[:alert] = @project_application.errors.full_messages.join("\n")
        redirect_to @project_application.project
      end
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

  def is_current_professional_signed_in(p)
    professional_signed_in? && current_professional.id == p.professional_id
  end

  def is_current_user_signed_in(p)
    user_signed_in? && current_user.id == p.project.user_id
  end

  def professional_profile_exists
    if professional_signed_in? && !current_professional.profile
      redirect_to current_professional
    end
  end

  private 
  
  def authenticate
    professional_signed_in? || user_signed_in?
  end

  def project_application_params 
    params.require(:project_application).permit(:introduction, :reason)
  end
end 
