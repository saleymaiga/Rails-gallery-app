class ArtistsController < ApplicationController

  def index
    @artist = Artist.all
  end

  def show
      @artist = Artist.where(id: params[:id]).first
  end

  def new
    if current_user
      @artist = Artist.new
    else
      redirect_to new_user_registration_path
    end
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      flash[:notice] = "Your account was created
      successfully."
      redirect_to artists_path
    else
      flash[:alert] = " There was a problem saving your
      account. "
      redirect_to new_artist_path
    end
  end

  def edit
     if current_user
      @artist = Artist.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update  #process data and update artist record 
    @artist = Artist.where(id: params[:id]).first 
    if @artist.update_attributes(artist_params)
      flash[:notice] = "Your account was updated
      successfully."
      redirect_to artist_path(@artist) 
    else
      flash[:alert] = "There was a problem saving your
      account."
      redirect_to new_artist_path #or :back to go back to where u just came from 
    end
  end

  def destroy
    @artist = Artist.where(id: params[:id]).first#.destroy
    if @artist && @artist.destroy
      flash[:notice] = "Artist #{@artist.fname} #{@artist.lname} deleted successfully!"
    else
      flash[:alert] = "there was a problem destroying #{@artist.fname}"
    end
    redirect_to root_path
  end

  private 
  def artist_params 
    params.require(:artist).permit(:id, :fname, :lname, :email, :location, :title, :bio, :artpic, :artist_id, :price)
  end
end 