class Api::V1::CategoriesController < ActionController::API

  def index
    categories = if params[:type] && params[:type] == 'inactive'
                    Category.inactive
                 else
                   Category.active
                 end
    render json: {message: 'OK', categories: categories.as_json(only: [:id, :name, :created_at, :is_active])}.to_json, status: 200
  end
  
  def show
    category = Category.find(params[:id])
    if category
      render json: {message: 'OK', category: category}.to_json, status: 200
    else
      render json: {message: 'Error', error: 'Category not found with the given id' }.to_json, status: 404
    end
  rescue => e
    render json: {message: 'Error', error: e.message }.to_json, status: 500
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: { message: 'OK', category: category}.to_json
    else
      render json: { message: 'Error', error: category.errors.full_messages }.to_json
    end
  end

  private
  
  def category_params
    params.permit(:name, :code, :is_active)
  end
end

