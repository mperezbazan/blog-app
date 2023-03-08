require 'rails_helper'

RSpec.describe 'User Page Index', type: :feature do
  before :each do
    @user = User.create(
      name: 'Martin',
      photo: 'https://cdn-icons-png.flaticon.com/512/3220/3220315.png',
      bio: 'Frontend',
      posts_counter: 0
    )
    @post1 = Post.create(author_id: @user.id, title: 'Hello1', text: 'This is my first post!', comments_counter: 0,
                         likes_counter: 0)
    @post2 = Post.create(author_id: @user.id, title: 'Hello2', text: 'This is my second post!', comments_counter: 0,
                         likes_counter: 0)
    @post3 = Post.create(author_id: @user.id, title: 'Hello3', text: 'This is my third post!', comments_counter: 0,
                         likes_counter: 0)
    visit user_path(@user.id)
  end
  it 'should have the profile picture of the user' do
    assert page.has_xpath?("//img[@src = 'https://cdn-icons-png.flaticon.com/512/3220/3220315.png']")
  end
  it 'should have the username' do
    expect(page).to have_content(@user.name)
  end
  it 'should have the number of posts written by user' do
    expect(page).to have_content('Number of posts: 3')
  end
  it 'should have the users bio' do
    expect(page).to have_content('Frontend')
  end
  it 'should have the first three posts of user' do
    expect(page).to have_content(@post1.title)
    expect(page).to have_content(@post2.title)
    expect(page).to have_content(@post3.title)
  end
  it 'should have a button for seeing all posts' do
    expect(page).to have_link('See all posts')
  end
  it 'should redirect to post show page upon click' do
    click_on 'Hello1'
    expect(page).to have_current_path user_post_path(@user.id, @post1.id)
  end
  it 'should redirect to all user posts index page on click' do
    click_link('See all posts')
    expect(page).to have_current_path user_posts_path(@user.id)
  end
end
