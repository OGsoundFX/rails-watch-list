class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def destroy
    List.find(params[:id]).delete
  end
end
