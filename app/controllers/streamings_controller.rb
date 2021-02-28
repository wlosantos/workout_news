class StreamingsController < ApplicationController

  before_action :set_streaming, only: %i[ show edit update destroy ]

  def index
    if params[:tag]
      @streamings = Streaming.tagged_with(params[:tag]).order(created_at: :desc).page(params[:page]).per(24)
    else
      @streamings = Streaming.page(params[:page]).per(24)
    end
  end

  def show
    @comments = @streaming.comments.where(published: :published)
  end

  def edit
  end

  def new
    @streaming = Streaming.new
  end

  def create
    @streaming = Streaming.new(streaming_params.merge(created_by: current_user))
    if @streaming.save
      redirect_to @streaming, notice: 'Video criado com sucesso!!!'
    else
      flash.now[:alert] = @streaming.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    if @streaming.update(post_params)
      redirect_to @streaming, notice: 'Video atualizado com sucesso!!!'
    else
      flash.now[:alert] = @streaming.errors.full_messages.to_setence
    end
  end

  def destroy
    @streaming.destroy
    redirect_to streaming_path
  end

  private

  def set_streaming
    @streaming = Streaming.find(params[:id])
  end

  def streaming_params
    params.require(:streaming).permit(:title, :description, :video, :tumbnail)
  end

end
