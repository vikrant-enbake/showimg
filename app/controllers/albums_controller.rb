class AlbumsController < ApplicationController
	def index
		
		@user = current_user
		@albums = @user.albums.page(params[:page]).per(7)
	end
	def new
		@album = current_user.albums.new
		@user = current_user	    
	    @pics = @album.pics.new
	    @pics.tags.build
	end

	def create		
		@album=current_user.albums.new(album_params)
		if @album.save			
	    	redirect_to @album
		else
			render 'new'
		end
	end

	def show
		@album=Album.find(params[:id])
		session[:current_album_id] = @album.id
	end

	def edit
		@album=Album.find(params[:id])
	end

	def update
	  @album =current_user.albums.find(params[:id])
	  if @album.update(album_params)
	    redirect_to @album
	  else
	    render 'edit'
	  end
	end

	def destroy 
		@album=Album.find(params[:id])		
		flash[:notice] = "album  #{@album.name}, id #{params[:id]} deleted succesfully"
		@album.destroy
		redirect_to albums_path
	end
	def delete_all
		@album=Album.where(user_id: current_user.id)
		@album.destroy_all
		redirect_to albums_path
	end

private
    def album_params
      params.require(:album).permit(:name, :description,  pics_attributes: [:name,:avatar,tags_attributes: [:name]])
     end
end
