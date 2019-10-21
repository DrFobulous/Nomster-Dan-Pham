class PlacesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

    def index
        @places = Place.all
    end

    def new
        @place = Place.new
    end

    def create
        @place = current_user.places.create(place_params)
        if @place.valid?
            redirect_to root_path
        else 
            render :new, status: :unprocessable_entity
        end

    end

    def show
        @place = Place.find(params[:id])

        if @place.user != current_user
            return render plain: 'Not Allowed', status: forbidden
        end
    end

    def edit
        @place = Place.find(params[:id])
    end 

    def update
        @place = Place.find(params[:id])
        @place.update_attributes(place_params)
        redirect_to root_path

        if @place.user != current_user
            return render plain: 'Not Allowed', status: forbidden
        end

        if @place.valid?
            redirect_to root_path
          else
            render :edit, status: :unprocessable_entity
          end
    end

    def destroy
        @place = Place.find(params[:id])
        @place.destroy
        redirect_to root_path

        if @place.user != current_user
            return render plain: 'Not Allowed', status: forbidden
        end
    end

    private

    def place_params
        params.require(:place).permit(:name, :description, :address)
    end 
    
   
end
