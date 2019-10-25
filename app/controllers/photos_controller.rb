class PhotosController < ApplicationController 
    before_action :authenticate_user!

    def create
        @photo = Photo.find(params[:place_id,:picture])
    end
end

