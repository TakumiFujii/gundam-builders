class Favorite < ApplicationRecord
  belongs_to :post
  belongs_to :user
  
  def self.dayly_ranking
    self.group(:post_id).where(created_at: Time.now.all_day).order('count_post_id DESC').limit(10).count(:post_id)
  end
  
  def self.monthly_ranking
    self.group(:post_id).where(created_at: Time.now.all_month).order('count_post_id DESC').limit(10).count(:post_id)
  end
  
  def self.whole_ranking
    self.group(:post_id).order("count_post_id DESC").limit(10).count(:post_id)
  end    
end
