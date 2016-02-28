class TitlesController < ApplicationController

  def index
    @titles = Title.all
  end

  def show
    @title = Title.find(params[:id])
  end


end
