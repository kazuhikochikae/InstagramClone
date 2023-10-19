class PicturesController < ApplicationController
  def favorites
    @favorite_pictures = current_user.favorites# 例: current_user にお気に入り情報がある場合
  end

  def show
  end


end
