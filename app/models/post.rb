class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_topics, dependent: :destroy
  has_many :topics, through: :post_topics
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 2, maximum: 150 }
  validates :description, presence: true, length: { minimum: 2, maximum: 2000 }
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }

  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:pciture, "Should be less than 5MB")
      end
    end
end
