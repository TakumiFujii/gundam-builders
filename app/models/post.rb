class Post < ApplicationRecord
  acts_as_taggable
  
  validates :title, presence: true
  validates :main_image, presence: true
  validates :main_dscr, presence: true
  validates :user_id, presence: true
  validates :category_id, presence: true
  
  mount_uploader :main_image, ImageUploader
  mount_uploader :appeal_1, ImageUploader
  mount_uploader :appeal_2, ImageUploader
  mount_uploader :appeal_3, ImageUploader
  mount_uploader :appeal_4, ImageUploader
  mount_uploader :process_a, ImageUploader
  mount_uploader :process_b, ImageUploader
  mount_uploader :process_c, ImageUploader
  mount_uploader :process_d, ImageUploader
 
  belongs_to :category
  belongs_to :user
  
  
  has_many :comments, dependent: :destroy
  has_many :posts_comments, through: :comments, source: :user
  
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  
  #dependent: :destroy　=>紐づいてるデータたちも一緒に削除してくれるオプション
  #そうですね。「has_many through」の方はいらないですね。
  #それがあると中間テーブルを経由してユーザーも全部削除しようとしますね。
  
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.all #全て表示。
    end
  end
end
