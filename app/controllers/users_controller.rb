class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    @favorite = Favorite.find_by(id: params[:id])
  end
end
