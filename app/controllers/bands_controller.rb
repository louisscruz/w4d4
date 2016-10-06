class BandsController < ApplicationController
  before_action :logged_in_only, only: [:show, :edit, :new, :create, :update, :destroy]
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  def index
    @bands = Band.all
  end

  def show
  end

  def new
  end

  def create
    band = Band.new(band_params)
    if band.save
      redirect_to band_url(band)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
