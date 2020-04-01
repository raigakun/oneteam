class FavoritesController < ApplicationController

  before_action :set_favorite, only: [:edit, :update]

  def edit
    @user = User.find_by(id: params[:user_id])
  end

  def update
    if @favorite.update_attributes(favorite_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:team, :player, :headcoach).merge(user_id: current_user.id)
  end

  def set_favorite
    @favorite = Favorite.find_by(id: params[:id])
  end
end
