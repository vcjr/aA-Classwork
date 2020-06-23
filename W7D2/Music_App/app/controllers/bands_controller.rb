class BandsController < ApplicationController
    

    def index
        @bands = Band.all
        # render json: @bands
        render :index
    end
    
    def show
        @band = Band.find(params[:id])
        
        # render json: @band
        render :show
    end


end
