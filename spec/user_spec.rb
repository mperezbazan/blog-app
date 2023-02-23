require 'rails_helper'

RSpec.describe User, type: :model do
  it 'name should be present' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end
  it 'posts_counter must be integer >= 0' do
    user = User.new(name: 'Name', posts_counter: 3.2)
    expect(user).to_not be_valid
  end
  it 'posts_counter is valid with 0' do
    user = User.new(name: 'Name', posts_counter: 0)
    expect(user).to be_valid
  end
end
