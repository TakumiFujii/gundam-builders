class ArticlesController < ApplicationController
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]
  
  
  def index
    @articles = Article.all
  end

  def show
    set_params
  end

  def new
    @article = current_user.article.build
  end

  def create
    @article = current_user.article.build(article_params)
    if @article.save
      flash[:success] ="保存成功"
      redirect_to @article
    else 
      flash[:danger] ="保存失敗"
      render :new
    end 
  end

  def edit
    set_params
  end

  def update
    set_params
    @article.update(article_params)
    redirect_to @article
  end

  def destroy
    set_params
    @article.destroy
    render :index
  end
  
  private 
  
  def set_params
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :content, :post_1, :comment_1, :post_2, :comment_2, :post_3, :comment_3, :post_4, :comment_4, :post_5, :comment_5, :post_6, :comment_6, :post_7, :comment_7, :post_8, :comment_8, :post_9, :comment_9, :post_10, :comment_10, :user_id)
  end
  
  def correct_user
    unless current_user == User.find(1)
      redirect_to root_url
    end
  end
end
