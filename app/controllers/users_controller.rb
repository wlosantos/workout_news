class UsersController < ApplicationController

  def show
   user = User.find_by(id: params[:id])
   @posts = user.posts.page(params[:page]).per(10)
   render "posts/index"
  end

  def edit
  end

  def profile
    if current_user.kind == 'user'
      render 'post/index'
    end

    @posts = current_user.posts.all
    @streamings = current_user.streamings.all
  end

  def update
    if current_user.update(user_params)
     redirect_to posts_path, notice: 'Seu perfil foi atualizado com successo!!!'
   else
     flash.now[:alert] = current_user.errors.full_messages.to_sentence
     render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :avatar, :email)
  end

end
