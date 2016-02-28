class RatingsController < ApplicationController

  def new
    @title = Title.find(params[:title_id])
    @rating = Rating.new
  end

  def create
    @title = Title.find(params[:title_id])
    @rating = @title.ratings.create(rating_params)
    redirect_to "/titles/#{@title.id}/ratings/#{@rating.id}"
  end

  def show
    @title = Title.find(params[:title_id])
    @rating = Rating.find(params[:id])
  end

private

  def rating_params
    params.require(:rating).permit(:score, :title_id)

  end

end
