class ListsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  def index
    # @lists = List.all
    @lists = policy_scope(List)
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @movies = Movie.all
    authorize @list
  end

  def new
    @list = List.new
    authorize @list
  end

  def create
    new_list = List.new(list_params)
    new_list.user = current_user
    authorize new_list
    if new_list.save
      redirect_to list_path(new_list)
    else
      flash[:notice] = "missing user"
      @list = List.new
      render :new
    end
  end

  def destroy
    list = List.find(params[:id])
    authorize list
    list.destroy
    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
