class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update  destroy]

    def index
        @users = User.all
        data = ActiveModelSerializers::SerializableResource.new(@users)
        render json: {success: true, data: data}

    end

    def new
        @user = Users.new
    end

    def show 
        render json: @user
    end

    def edit
    end
    
    def create
        @user= User.new(user_params)

        if @user.save
            render json: @user, status: :created, location: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end


    def update
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @user.destroy
    end
    
    private
        
    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:email, :password_digest, :first_name, :last_name, :user_id)
    end
end
