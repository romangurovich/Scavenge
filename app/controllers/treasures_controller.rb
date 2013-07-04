class TreasuresController < ApplicationController
  respond_to :json

  def index
    respond_with Treasure.all
  end

  def show
    respond_with Treasure.find(params[:id])
  end

  def create
    respond_with Treasure.create(treasure_params)
  end

  def update
    respond_with Treasure.update(params[:id], treasure_params)
  end

  def destroy
    respond_with Treasure.destroy(params[:id])
  end

  private

  def treasure_params
    params.require(:treasure).permit(:title, :description, :found)
  end

end
