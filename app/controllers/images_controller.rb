class ImagesController < ApplicationController
  def create
    image.create(image_params)
  end

  private

  def image_params
    params.require(:image).permit(:image).merge(user_id: current_user.id)
  end
end
