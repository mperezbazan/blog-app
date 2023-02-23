require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'title should be present' do
    post = Post.new(title: nil, comments_counter: 0, likes_counter: 0, author_id: 1)
    expect(post).to_not be_valid
  end
  it 'title maximum 250 chars' do
    post = Post.new(title: 'a' * 251)
    expect(post).to_not be_valid
  end
  it 'likes_counter not valid with a letter' do
    post = Post.new(title: 'Title', comments_counter: 0, likes_counter: 'a')
    expect(post).to_not be_valid
  end
end
