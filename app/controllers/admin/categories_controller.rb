class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.order(:id)
    respond_to do |format|
      format.html # renders app/views/admin/categories/index.html.erb
      format.json { render json: @categories }
    end
  end

  def show
    respond_to do |format|
      format.html # renders app/views/admin/categories/show.html.erb
      format.json { render json: @category }
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      respond_to do |format|
        format.html { redirect_to admin_category_path(@category), notice: "Category created." }
        format.json { render json: @category, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      respond_to do |format|
        format.html { redirect_to admin_category_path(@category), notice: "Category updated." }
        format.json { render json: @category, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: "Category deleted." }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
