class FileUploadsController < ApplicationController
  
  before_action :find_file_upload, only: [:show, :edit, :update, :destroy]

def index
  @fileUploads = FileUpload.all.order("Created_at DESC")
end

def new
  @fileUpload = FileUpload.new
end

def create
    @fileUpload = FileUpload.new(file_params)

    if @fileUpload.save
      redirect_to @fileUpload :Notice "Post not saved."
    else
      render 'new' :Notice "Post saved."
    end
  end

def edit
end

def show
end

def update
  if @fileUpload.update(edit_params)
    redirect_to @file
  else
    render 'edit'
  end
end

def destroy
  @fileUpload.destroy
    redirect_to root_path
end


private

  def find_file_upload
    @fileUpload = FileUpload.find(params[:id])
  end

  def file_params
    params.require(:fileUpload).permit(:filename, :created_at, :description, :source, :bin)
  end

  def edit_params
    params.require(:fileUpload).permit(:filename, :updated_at, :description, :source, :bin)
  end

end