class RatingsController < ApplicationController

  def new
    @title = Title.find(params[:title_id])
    @rating = Rating.new
  end

  def create
    @title = Title.find(params[:title_id])
    @rating = @title.ratings.create(rating_params)
    if @rating.save
      redirect_to "/titles/#{@title.id}/ratings/#{@rating.id}"
    else
      flash[:error] = "Please rate on a 1-5 scale"
      render :new
    end
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
