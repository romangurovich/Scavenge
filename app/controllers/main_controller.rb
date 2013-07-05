class MainController < ApplicationController
  def index
    gon.treasures = Treasure.all
  end
end
