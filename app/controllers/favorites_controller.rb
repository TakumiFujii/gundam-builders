class FavoritesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    current_user.favorite(post)
    flash[:success] = "お気に入りに登録しました！"
    redirect_to post
  end

  def destroy
    post = Post.find(params[:post_id])
    current_user.unfavorite(post)
    flash[:succes] = "お気に入りから解除しました！"
    redirect_to post
  end
end
