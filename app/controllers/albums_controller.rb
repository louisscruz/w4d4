class AlbumsController < ApplicationController
  before_action :logged_in_only
  before_action :set_album, only: [:show, :update, :destroy]

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_album
    @album = Album.find(params[:id])
  end
end
