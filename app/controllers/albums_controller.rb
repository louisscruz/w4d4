class AlbumsController < ApplicationController
  before_action :logged_in_only, only: [:show]
  before_action :admin_only, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
  end

  def create
    album = Album.new(album_params)
    album.band_id = params[:band_id]
    if album.save
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = album.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:name, :year, :live)
  end
end
