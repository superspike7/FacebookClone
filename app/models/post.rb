class Post < ApplicationRecord
  has_many :comments
  has_many :likes, dependent: :destroy
  belongs_to :user
end
