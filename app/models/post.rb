class Post < ApplicationRecord
    has_one_attached :photo
    has_many :comments
    belongs_to :user
    
    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 10 }
end
