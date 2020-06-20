class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end 

    def show
        @cat = Cat.find_by(id: params[:id])

        if @cat
            render :show
        else
            redirect_to cats_url
        end
    end

    # Remember that we need the new and create actions together to be able to have
    # a functioning cycle to create a new cat.
    # The `new` action will just render a form for us to put values into a dummy
    # instance so that once we have that form. Inside of it we will call the 
    # create to send the data to the database using the create action.
    def new # A route to the form where new is
        @cat = Cat.new
        render :new 
    end

    def create # an action to submit the form to
        @cat = Cat.new(cat_params)

        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :new
            # render json: @cat.errors.full_messages, status: 422
        end
    end

    def edit # A route that leads to a form that submits that info to the update route action
        @cat = Cat.find_by(id: params[:id])
        render :edit
    end

    def update
        @cat = Cat.find_by(id: params[:id])

        if @cat.update_attributes(cat_params)
            redirect_to cat_url(@cat)
        else
            render :edit
            # render json: @cat.errors.full_messages, status: 422
        end
    end

    private

    def cat_params
        params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
    end
end