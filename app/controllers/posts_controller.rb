class PostsController < ApplicationController
  before_action :set_post, only: %i[show]
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @posts = Post.all

    if params[:query].present?
      @posts = @posts.where(meduim: params[:query])
      render(json: { alert: "No posts found" }, status: :not_found) if @posts.empty?
    end
  end

  def show
  end

  def create
    @post = Post.new(post_params)

    @post.user = current_user

    if @post.save
      render :show, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :meduim, photos: [])
  end
end
