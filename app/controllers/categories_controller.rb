class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  # GET /categories
  def index
    categories = Category.order(:name)
    render json: categories
  end

  # GET /categories/:id
  def show
    render json: {
      id:              @category.id,
      name:            @category.name,
      equipment_count: @category.equipment.count,
      created_at:      @category.created_at,
      updated_at:      @category.updated_at
    }
  end

  # POST /categories
  def create
    category = Category.new(category_params)

    if category.save
      render json: category, status: :created
    else
      render json: { errors: category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /categories/:id
  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /categories/:id
  def destroy
    equipment_count = @category.equipment.count

    if equipment_count > 0
      render json: {
        error: "Cannot delete category. #{equipment_count} equipment items still belong to it."
      }, status: :conflict
    else
      @category.destroy
      head :no_content
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Category not found" }, status: :not_found
  end

  def category_params
    params.require(:category).permit(:name)
  end
end