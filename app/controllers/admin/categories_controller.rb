class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
    @category = Category.new    
  end

  def new
    @category = Category.new
  end

  def create
    gif = Gif.select_random_gif(params[:category][:name])
    byebug
    @category = Category.find_by(name: params[:category][:name])
    if @category.nil?
      @category = Category.create(category_params)
    end
    @category.gifs.create(url: gif['data']['image_url'])
      redirect_to admin_categories_path
  end

    private

    def category_params
      params.require(:category).permit(:name)
    end
   
end