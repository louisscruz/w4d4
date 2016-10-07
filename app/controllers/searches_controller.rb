class SearchesController < ApplicationController
  def create
    response = Hash.new([])
    if search_params[:type] == "All" || search_params[:type] == "Band"
      response[:bands] = Band.joins(:tags).where("tags.body = ?", search_params[:body])
    elsif search_params[:type] == "All" || search_params[:type] == "Album"
      response[:albums] = Album.joins(:tags).where("tags.body = ?", search_params[:body])
    elsif search_params[:type] == "All" || search_params[:type] == "Track"
      response[:tracks] = Track.joins(:tags).where("tags.body = ?", search_params[:body])
    end
    render json: response
  end

  private

  def search_params
    params.require(:search).permit(:body, :type)
  end
end
