class CommentsController < ApplicationController
  def show
  end

  def create
    @comment = current_user.comments.build(comments_params)
    @post = @comment.post
    if @comment.save
      flash[:success] = "コメントしました！"
      redirect_to @post
    else
      flash[:danger] = "コメントに失敗しました..."
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def edit
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end

  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post
    if @comment.update(comments_params)
      flash[:success] = "編集しました！"
      redirect_to @post
    else
      flash[:danger] = "編集に失敗しました..."
      redirect_to @post
    end
  end
  
  private
  
  def comments_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
