class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_create :increment_likes

  def increment_likes
    post.increment!(:likes_counter)
  end
end
