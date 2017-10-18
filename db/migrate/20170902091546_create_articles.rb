class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :content
      
      t.string :post_1
      t.string :comment_1
      t.string :post_2
      t.string :comment_2
      t.string :post_3
      t.string :comment_3
      t.string :post_4
      t.string :comment_4
      t.string :post_5
      t.string :comment_5
      t.string :post_6
      t.string :comment_6
      t.string :post_7
      t.string :comment_7
      t.string :post_8
      t.string :comment_8
      t.string :post_9
      t.string :comment_9
      t.string :post_10
      t.string :comment_10
      
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
