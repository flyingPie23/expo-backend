class PostsController < ApplicationController
  before_action :set_post, only: %i[ show ]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    if user_signed_in?
      @posts = Post.last
      render json: @posts
    else
      @posts = Post.all
      render json: @posts
    end
  end

  def show
    @post = Post.find(params[:id])

    render json: @post
  end

  def create
    @post = Post.new(post_params)

    @post.user = current_user

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
