class FavoritesController < ApplicationController
  def index
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんの写真をお気に入り登録しました"
  end

  def destroy
    # binding.pry
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんの写真をお気に入り解除しました"
  end

end
