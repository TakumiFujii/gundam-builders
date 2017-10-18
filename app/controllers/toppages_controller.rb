class ToppagesController < ApplicationController
  def index
    if logged_in?
      @posts = Post.order("id DESC").order('created_at DESC').page(params[:page])
    end
  end
end
