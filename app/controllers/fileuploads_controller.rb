class FileuploadsController < ApplicationController

  before_action :find_fileupload, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def index
    @fileuploads=Fileupload.all
  end

  def new
    @fileupload=Fileupload.new
  end

  def create
    @fileupload = Fileupload.new(fileupload_params)

    if @fileupload.save
      redirect_to @fileupload
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
    @fileupload.destroy
    redirect_to fileupload_path
  end

  private

    def find_fileupload
      @fileupload = Fileupload.find(params[:id])
    end

    def fileupload_params
      params.require(:fileupload).permit(:section, :title, :description, :source, :bin)
    end

end
