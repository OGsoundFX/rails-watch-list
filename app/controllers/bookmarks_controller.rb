class BookmarksController < ApplicationController
  def new
  end

  def create
    new_bookmark = Bookmark.new(bookmark_params)
    new_bookmark.list_id = params[:list_id]
    authorize new_bookmark
    if new_bookmark.save
      redirect_to list_path(params[:list_id])
    else
      # flash[:notice] = "wrong entry try again"
      flash[:notice] = new_bookmark.errors.full_messages.to_sentence
      redirect_to list_path(params[:list_id])
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
