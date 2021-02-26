class Streamings::CommentsController < CommentsController

  before_action :set_commentable

  private

  def set_commentable
    @commentable = Streaming.find(params[:streaming_id])
  end

end
