class FileuploadsController < ApplicationController

  before_filter :authenticate_user!, except: [:show, :index, :by_language]
  before_action :find_fileupload, only: [:show, :edit, :update, :destroy]

  def edit
  end

  def index
    @fileuploads = Fileupload.all.order("created_at desc").paginate(page: params[:page], per_page: 15)
  end

  def by_language

    @fileuploads = Fileupload.by_language(params[:sort]).order("created_at desc").paginate(page: params[:page], per_page: 15) if params[:sort].present?
    render action: "index"
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
  end

  private

    def find_fileupload
      @fileupload = Fileupload.friendly.find(params[:id])
    end

    def fileupload_params
      params.require(:fileupload).permit(:title, :description, :code, :slug, :language_id, :sort)
    end

end
