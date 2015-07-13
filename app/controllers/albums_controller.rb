class AlbumsController < ApplicationController
  def index
    @user = current_user
    @albums = @user.albums.page(params[:page]).per(7)
    session[:current_album_id] = nil
  end
  def new
    @album = current_user.albums.new
    @user = current_user
    @pics = @album.pics.new
    @pics.tags.build
    session[:current_album_id] = nil
 end

  def create
    debugger
    @album=current_user.albums.new(album_params)
    session[:current_album_id]= nil
    if @album.save
      redirect_to @album
    else
      render 'new'
    end
  end

  def show
    @album=current_user.albums.find(params[:id])
    session[:current_album_id] = @album.id
  end

  def edit
    @album=current_user.albums.find(params[:id])
    session[:current_album_id] = @album.id
  end

  def update
    @album =current_user.albums.find(params[:id])
    session[:current_album_id] = @album.id
    if @album.update(album_params)
      redirect_to @album
    else
      render 'edit'
    end
  end

  def destroy 
    @album=Album.find(params[:id])
    session[:current_album_id] = @album.id
    flash[:notice] = "album  #{@album.name}, id #{params[:id]} deleted succesfully"
    @album.destroy
    redirect_to albums_path
  end
  def delete_all
    session[:current_album_id] = nil
    @album=Album.where(user_id: current_user.id)
    @album.destroy_all
    redirect_to albums_path
  end

  private
    def album_params
      params.require(:album).permit(:name, :description,:avatar,  pics_attributes: [:id, :name,:avatar,:all_tags])
    end
end
