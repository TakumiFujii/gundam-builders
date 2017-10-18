class PostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
    @posts = Post.search(params[:search]).order('created_at DESC').page(params[:page])
  end
  
  def show
    @post = Post.find(params[:id])
    @tags = @post.tag_list
    @comment = current_user.comments.build(post_id: @post.id)
    @comments = @post.comments
    
  end

  def new
    @post = current_user.posts.build
    @categories = Category.all
  
  end

  def create
    @post = current_user.posts.build(post_params)

    Rails.logger.info('=====')
    Rails.logger.info(params)
    Rails.logger.info(params[:item][:tags])
    Rails.logger.info('=====')

    # params から tags 情報を取得する
    if params[:item].present?
      params[:item][:tags].each do |tag|
        @post.tag_list.add(tag)
      end
    end

    if @post.save
      flash[:success] = "投稿しました！"
      redirect_to root_url
    else
      flash[:danger] ="投稿に失敗しました..."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "投稿内容を編集しました！"
      redirect_to @post
    else
      flash[:danger] = "編集に失敗しました..."
      render :edit
    end
    
    # tagの処理
    # tagsのアップデートは一回全部削除して入力されたのをまた登録し直すイメージ
    @tags = @post.tag_list
    @tags.each do |tag|
      @post.tag_list.remove(tag)
    end
    
    if params[:item].present?
      params[:item][:tags].each do |tag|
        @post.tag_list.add(tag)
      end
    end
    
    @post.save
  end

  def destroy
    @post.destroy
    flash[:success] = "投稿を削除しました！"
    redirect_to root_url
  end

  def tags
    @tag_name = params[:name]
    @posts = Post.tagged_with(@tag_name).page
  end

  private
  
  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
      unless @post
        redirect_to root_url
      end
  end
  
  def post_params
    params.require(:post).permit(:title, :main_image, :main_dscr, :appeal_1, :dscr_1, :appeal_2, :dscr_2, :appeal_3, :dscr_3, :appeal_4, :dscr_4, :process_a, :dscr_a, :process_b, :dscr_b, :process_c, :dscr_c, :process_d, :dscr_d, :short_message, :user_id, :category_id, :tag_list)
  end
end
