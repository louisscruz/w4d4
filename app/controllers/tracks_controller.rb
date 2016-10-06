class TracksController < ApplicationController
  before_action :logged_in_only
  before_action :set_track, only: [:show, :update, :destroy]

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

  def set_track
    @track = Track.find(params[:id])
  end
end
