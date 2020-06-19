class UsersController < ApplicationController
    
    def index
        if params.has_key?(:username)
            @user = User
                    .where("users.username ILIKE '%#{params[:username]}%'")
            render json: @user
        else 
            @users = User.all
            render json: @users
        end
    end
    
    def show
        @user = User.find_by(id: params[:id])
        render json: @user
    end
    # params.require(:superhero).permit(:name, :secret_identity, :power)
    def create
        @user = User.new(user_params)
        if @user.save 
            redirect_to create_user_url
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        
        if @user.update(user_params)
            redirect_to update_url(@user)
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])

        if @user.destroy
            render json: @user
        else
            render json: @user.errors.full_messages, status: 422
        end
    end 

    private

    def user_params
        params.require(:user).permit(:username)
    end
end