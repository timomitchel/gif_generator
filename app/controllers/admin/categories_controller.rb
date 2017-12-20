class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:destroy]
  def index
    @categories = Category.all
    @category = Category.new    
  end

  def new
    @category = Category.new
  end

  def create
    gif = Gif.select_random_gif(params[:category][:name])
    @category = Category.find_by(name: params[:category][:name])
    if @category.nil?
      @category = Category.create(category_params)
    end
    @category.gifs.create(url: gif['data']['image_url'])
      redirect_to admin_categories_path
  end

  def destroy
    @category.destroy
    flash[:success] = "#{@category.name} was successfully deleted!"
    redirect_to admin_categories_path
  end

    private

    def category_params
      params.require(:category).permit(:name)
    end
    
    def set_category
      @category = Category.find(params[:id])
    end
end