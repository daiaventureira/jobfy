class ProjectsController < ApplicationController 
    def index 
        @projects = Project.all
    end
    def show 
    end

    def new 
        @projects = Project.new
    end

    def create
        @projects = Project.new(project_params)
        if @projects.save
            redirect_to root_path, notice: 'Projeto criado com sucesso!'
        else
            render :new
        end
    end

    private

    def project_params 
        params.require(:project).permit(:title, :description, :skills, :deadline, :price_per_hour, :remote)
    end

end
