class PhotosController < ApplicationController 
    before_action :authenticate_user!

    def create
        @place = Place.find(params[:place_id])
        @place.photos.create(photo_params.merge(user: current_user)) 
        redirect_to place_path(@place)
    end

    def show
        @place = Place.find(params[:user_id])
        @place.user.create(user_params.merge(user: current_user))
        redirect_to user_path(@user)
    end


    private

    def photo_params
        params.require(:photo).permit(:picture, :caption)
    end
end

