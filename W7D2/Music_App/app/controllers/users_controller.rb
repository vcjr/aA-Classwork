class UsersController < ApplicationController

    def index
        render :index
    end

    def show
        # user = User.find_by(params[:email])
        render :show
    end

    def new
        user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)

        @user.password = user_params[:password]

        if @user.save
            # By setting the session cookie session_token equal to the user
            # We are now in play and "logged in"
            session[:session_token] = @user.reset_session_token!
            redirect_to user_url(@user)
        else    
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end
    

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
