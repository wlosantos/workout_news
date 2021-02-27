class FriendsController < ApplicationController

  def create
    friend = current_user.friends.build friend_params

    if friend.save
      render json: {successfull: true}
    else
      render json: {succesfull: false}
    end
  end

  private

  def friend_params
    params.require(:friend).permit(:friend)
  end

end
