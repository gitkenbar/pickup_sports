class Post < ApplicationRecord
  ##- validations
  validates :content, presence: true, length: {maximum: 2000}
  belongs_to :user

  ##- associations
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
end
