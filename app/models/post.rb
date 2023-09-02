class Post < ApplicationRecord
  has_one_attached :photo
  has_many :comments
  has_many :likes, as: :record
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  def like_by?(user)
    likes.where(user:).any?
  end

  def like(user)
    likes.where(user:).first_or_create
  end

  def unlike(user)
    likes.where(user:).destroy_all
  end
end
