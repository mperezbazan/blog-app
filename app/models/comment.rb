class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_create :increment_comments
  def increment_comments
    post.increment!(:comments_counter)
  end
end
