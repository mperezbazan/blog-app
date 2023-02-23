require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0) }
  before { subject.save }
  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'posts_counter must be integer' do
    subject.posts_counter = 1.2
    expect(subject).to_not be_valid
  end
  it 'posts_counter must to be >= 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end
  it 'most recent post must be array' do
    expect(subject.recent_posts.length).to eql(0)
  end
end
