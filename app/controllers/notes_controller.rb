# frozen_string_literal: true

class NotesController < ApplicationController

  def index
    @notes = current_user.notes
    render json: @notes
  end


  def show
    @note = current_user.find(params[:id])
    render json: @note
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      render json: @note, status: :created
    else
      render json: { errors: @note.errors }, status: :unprocessable_entity
    end
  end

  def update
    @note = current_user.find(params[:id])
    if @note.update(note_params)
      render json: @note
    else
      render json: { errors: @note.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @note = current_user.find(params[:id])
    if @note
      @note.destroy
    else
      render json: { errors: @note.errors }, status: :unprocessable_entity
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :body, :cover)
  end
end
