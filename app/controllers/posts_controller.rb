class PostsController < ApplicationController

  before_action :set_posts, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params.merge(created_by: current_user))
    if @post.save
      redirect_to @post, notice: 'Post created successfully!!!'
    else
      flash.now[:alert] = @post.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated successfully!!!'
    else
      flash.now[:alert] = @post.errors.full_messages.to_setence
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def set_posts
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
