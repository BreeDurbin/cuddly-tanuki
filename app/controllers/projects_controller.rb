class ProjectsController < ApplicationController

	before_action :find_project, only: [:show, :edit, :update, :destroy]

	def index
		@projects=Project.all.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
	end

	def project
		@projects=Project.all.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
	end

	def edit
  	end

	def new
		@project=Project.new
	end

	def create
		@project=Project.new(project_params)
		if @project.save
			redirect_to @project
		else
			render 'new'
		end
	end

	def update
		if @fileupload.update(fileupload_params)
			redirect_to @fileupload
		else
			render 'edit'
		end
	end

	def show
	end

	def destroy
		@project.destroy
		redirect_to project_path
	end

	private

	def find_project
		@project = Project.friendly.find(params[:id])
	end

	def project_params
		params.require(:fileupload).permit(:section, :title, :description, :source, :bin, :slug)
	end
	
end
