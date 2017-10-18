class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]

  def index
    @users = User.all
  end
  
  def show 
    set_params
    counts(@user)
    @posts = @user.posts.order('created_at DESC').page(params[:page])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "ガンビルにようこそ！"
      redirect_to @user
    else
      flash[:danger] = "申し訳ありません、登録に失敗しました..."
      render :new
    end
  end
  
  def edit
    set_params
  end
  
  def update
    set_params
    if @user.update(user_params)
      flash[:success] = "プロフィール情報を変更しました。"
      redirect_to @user
    else
      flash[:danger] = "プロフィール情報の変更に失敗しました"
      redirect_to @user
    end
  end
  
  def delete
    set_params
    
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def favorites
    @user = User.find(params[:id])
    @favorites = @user.favorite_posts.page(params[:page])
    counts(@user)
  end
  
  private 
  
  def set_params
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :password, :password_confirmation)
  end
end