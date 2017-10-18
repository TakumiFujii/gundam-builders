class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :main_image
      t.string :main_dscr
      t.string :appeal_1
      t.string :dscr_1
      t.string :appeal_2
      t.string :dscr_2
      t.string :appeal_3
      t.string :dscr_3
      t.string :appeal_4
      t.string :dscr_4
      t.string :process_a
      t.string :dscr_a
      t.string :process_b
      t.string :dscr_b
      t.string :process_c
      t.string :dscr_c
      t.string :process_d
      t.string :dscr_d
      t.string :short_message
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
