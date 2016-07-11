class FileuploadsController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :index]
  before_action :find_fileupload, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def index
    @fileuploads = Fileupload.all.order("created_at desc").paginate(page: params[:page], per_page: 15)
    @fileuploads = Fileupload.where(language_id: params[:sort]).order("created_at desc").paginate(page: params[:page], per_page: 15) if params[:sort].present?
  end

  # def by_language
  #   @fileuploads = Fileupload.where(language_id: params[:sort]).order("created_at desc").paginate(page: params[:page], per_page: 15) if params[:sort].present?
  # end

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
  end

  private

    def find_fileupload
      @fileupload = Fileupload.friendly.find(params[:id])
    end

    def fileupload_params
      params.require(:fileupload).permit(:title, :description, :source, :bin, :slug, :language_id, :sort)
    end

end
