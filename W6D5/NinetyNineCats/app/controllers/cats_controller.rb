class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
        # render json: @cats
    end 

    def show
        @cat = Cat.find_by(id: params[:id])
        render :show
        # render json: @cat
    end
end