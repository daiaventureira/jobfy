class ProjectsController < ApplicationController
    before_action :authenticate_professional!, only: %i[show index]
    before_action :authenticate_user!, only: %i[new close create]
    helper_method :professional_has_applied?
    helper_method :exceed_deadline?

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

    def exceed
      @projects = Project.find(params[:id])

        if @projects.exceed_deadline?
            @project.closed!
        end
    end

    def professional_has_applied?
        professional_signed_in? && current_professional.projects.where(id: @projects.id).present?
    end

    private

    def project_params
        params.require(:project).permit(:title, :description, :skills, :deadline, :price_per_hour, :remote)
    end
end
