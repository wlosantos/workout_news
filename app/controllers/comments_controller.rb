class CommentsController < ApplicationController

  before_action :set_comment, only: %i[ update ]

  def create
    @comment = @commentable.comments.new comment_params
    @comment.created_by = current_user
    if @comment.save
      redirect_to @commentable, notice: 'Comentário adicionado com sucesso!!!'
    else
      flash.now[:alert] = @comment.errors.full_messages.to_sentense
      redirect_to @commentable
    end
  end

  def update
    if @comment.update(comment_params)
      render json: { successull: true}
    else
      render json: { successull: false}
    end
  end

    private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:commenter, :published)
    end

end
