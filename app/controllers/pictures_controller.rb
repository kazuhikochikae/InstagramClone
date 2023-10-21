class PicturesController < ApplicationController
  def favorites
    @favorites = current_user.favorites
  end

  def show
  end


end
