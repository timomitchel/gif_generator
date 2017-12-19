class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
    @category = Category.new    
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    category.save
    if category.save
      flash[:success] = "Category #{category} created"
      redirect_to admin_categories_path
    else
      flash[:error]
      render :index
    end
  end

    private

    def category_params
      params.require(:category).permit(:name)
    end
   
end