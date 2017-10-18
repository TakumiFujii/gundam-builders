class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @tags = ActsAsTaggableOn::Tag.most_used(100)
  end
  
  def grades
    @category = Category.find(params[:id])
    @posts = @category.posts.page(params[:page])
  end
end
