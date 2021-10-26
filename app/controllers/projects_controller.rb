class ProjectsController < ApplicationController 
    helper_method :professional_has_applied?

    def index 
        @projects = Project.all
    end


    def new 
        @projects = Project.new
    end

    def create
        @projects = Project.new(project_params)
        @projects.user = current_user 
        if @projects.save
            redirect_to root_path, notice: 'Projeto criado com sucesso!'
        else
            render :new
        end
    end

    def show 
        @projects = Project.find(params[:id])
        @project_application = ProjectApplication.new
    end

    def close 
        @project = Project.find(params[:id])
        @project.closed!
        redirect_to root_path
    end

    def professional_has_applied?
        professional_signed_in? && current_professional.projects.where(id: @projects.id).present?
    end

    private

    def project_params 
        params.require(:project).permit(:title, :description, :skills, :deadline, :price_per_hour, :remote)
    end

end
