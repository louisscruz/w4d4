class NotesController < ApplicationController
  before_action :set_note, only: [:destroy]
  before_action :correct_user_only, only: [:destroy]
  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    note.track_id = params[:track_id]
    unless note.save
      flash[:errors] = note.errors.full_messages
    end
    redirect_to track_url(params[:track_id])
  end

  def destroy
    @note.destroy
    redirect_to :back
  end

  private
  def note_params
    params.require(:note).permit(:body)
  end

  def set_note
    @note = Note.find(params[:id])
  end

  def correct_user_only
    unless @note.user_id == current_user.id || is_admin?
      flash[:errors] = ["Unauthorized"]
      redirect_to :back
    end
  end
end
