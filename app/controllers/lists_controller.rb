class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @movies = Movie.all
  end

  def new
    @list = List.new
  end

  def create
    new_list = List.new(list_params)
    if new_list.save
      redirect_to list_path(new_list)
    else
      render :new
    end
  end

  def destroy
    List.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
