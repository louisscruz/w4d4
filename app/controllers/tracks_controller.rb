class TracksController < ApplicationController
  before_action :logged_in_only, only: [:show]
  before_action :admin_only, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_track, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
  end

  def create
    track = Track.new(track_params)
    track.album_id = params[:album_id]
    if track.save
      redirect_to track_url(track)
    else
      flash[:errors] = track.errors.full_messages
    end
  end

  def edit
  end

  def update
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash[:errors] = @track.errors.full_messages
    end
  end

  def destroy
  end

  private

  def set_track
    @track = Track.includes(:notes).find(params[:id])
  end

  def track_params
    params.require(:track).permit(:name, :bonus, :lyrics)
  end
end
