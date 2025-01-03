class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
