class BookmarksController < ApplicationController
  def new
  end

  def create
    new_bookmark = Bookmark.new(bookmark_params)
    new_bookmark.list_id = params[:list_id]
    if new_bookmark.save
      redirect_to list_path(params[:list_id])
    else
      redirect_to list_path(params[:list_id])
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
