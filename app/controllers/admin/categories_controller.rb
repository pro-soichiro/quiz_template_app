class Admin::CategoriesController < ApplicationController
  before_action :authenticate_admin!
  before_action :ensure_category, only: [:edit, :update, :destroy]

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      @categories = Category.all
      render :index
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy if @category
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def ensure_category
    @category = Category.find(params[:id])
  end
end
