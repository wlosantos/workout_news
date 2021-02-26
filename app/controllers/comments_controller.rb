class CommentsController < ApplicationController

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

    private

    def comment_params
      params.require(:comment).permit(:commenter)
    end

end
