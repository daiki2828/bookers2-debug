class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :view_counts, dependent: :destroy
  
  validates :title,presence:true


  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
