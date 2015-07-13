class PicsController < ApplicationController
  def index
    
  end

  def new
    @pic = Pic.new
    @pic.tags.build
  end
  def edit
    @pic = Pic.find(params[:id])
  end
  def create
    @pic= Pic.new(allow_params)	
    @pic.save
    redirect_to album_path(session[:current_album_id])
  end
  def update
    @pic = Pic.find(params[:id])
    if @pic.update(allow_params)
      redirect_to @pic
    else
      render 'edit'
    end
  end
  def show
    @pic = Pic.find(params[:id])
  end

  def destroy 
    @pic=Pic.find(params[:id])
    @pic.destroy
    redirect_to :back
  end

  def delete_all
    @pic=Pic.where(album_id: session[:current_album_id])		
    @pic.destroy_all
    redirect_to album_path(session[:current_album_id])
  end

  private
    def allow_params
      params.require(:pic).permit(:name,:desc,:album_id, :avatar,:all_tags)
    end

end
