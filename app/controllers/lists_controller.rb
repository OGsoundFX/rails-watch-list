class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
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
    List.find(params[:id]).delete
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
