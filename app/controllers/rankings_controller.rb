class RankingsController < ApplicationController
  
  def index
  end
  
  def dayly
    @ranking_counts = Favorite.dayly_ranking
    @posts = Post.find(@ranking_counts.keys)
  end

  def monthly
    @ranking_counts = Favorite.monthly_ranking
    @posts = Post.find(@ranking_counts.keys)
  end

  def whole
    @ranking_counts = Favorite.whole_ranking
    @posts = Post.find(@ranking_counts.keys)
  end
end
