class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @user = User.find(current_user.id)
    @post = Post.new
  end

  def create
    current_user = User.find(params[:user_id])
    @post = Post.new(post_params)
    @user = User.find(current_user.id)

    @post.author_id = @user.id
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      flash[:notice] = 'Post created successfully.'
      redirect_to user_path(@post.author_id), notice: 'Post created successfully'
    else
      render :new, alert: 'Error creating post'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
