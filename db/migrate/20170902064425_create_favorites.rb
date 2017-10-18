class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.index [:user_id, :post_id], unique: true
      t.timestamps
    end
  end
end
