class LikesController < ApplicationController
  def new
    @new_like = Like.new
  end

  def create
    current_user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @user = current_user.id
    @new_like = Like.new
    @new_like.author_id = @user
    @new_like.post_id = @post.id
    if @new_like.save
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id)
    else
      redirect_to user_post_path(user_id: @post.author_id, id: @post.id),
                  alert: 'Error'
    end
  end
end
