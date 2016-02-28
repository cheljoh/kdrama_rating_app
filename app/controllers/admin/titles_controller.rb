class Admin::TitlesController < Admin::BaseController

  def index
    @titles = Title.all
  end

  def new
    @title = Title.new
  end

  def create
    @title = Title.new(title_params)
    if @title.save
      redirect_to admin_title_path(@title)
    else
      render :new
    end
  end

  def show
    @title = Title.find(params[:id])
  end

  def edit
    @title = Title.find(params[:id])
  end

  def update
    @title = Title.find(params[:id])
    if @title.update(title_params)
      redirect_to admin_title_path(@title)
    else
      render :edit
    end
  end

  def destroy
    @title = Title.find(params[:id])
    @title.destroy
    redirect_to admin_titles_path
  end

private

  def title_params
    params.require(:title).permit(:name, :image_path, :category_id)
  end

end
