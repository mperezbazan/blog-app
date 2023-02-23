require 'rails_helper'

RSpec.describe Post, type: :model do
  test_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
  subject do
    Post.new(
      author_id: test_user.id,
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )
  end
  before { subject.save }
  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'title maximum 250 chars' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end
  it 'comments_counter not valid with a <0 number' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
  it 'likes_counter not valid with a letter' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
  end
  it 'Post counter for user must be incremented' do
    expect(subject.user.posts_counter).to eql(1)
  end
  it 'Show recent comments in array' do
    Comment.create(author_id: test_user.id, post_id: subject.id, text: 'Test comment')
    expect(subject.recent_comments.length).to eql(1)
  end
end
