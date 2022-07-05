class UsersController < ApplicationController
    before_action :set_user, only: %i[show edit update  destroy]

    def index
         @user = Users.all
    end

    def new
        @user = Users.new
    end

    def show 
    end

    def edit
    end
    
    def create
        @user= User.new(user_params)

        respond_to do |format|
            if @User.save
                format.html { redirect_to user_url(@user), notice: "User was successfully created." }
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @user.errors, status: :unprocessable_entity }
            end
        end


        def update
            respond_to do |format|
                if @user.update(user_params)
                    format.html {redirect_to user_url(@user), notice: "User was succesfully updated"}
                    format.json {render :show, status: :created, location: @user}
                else
                    format.html {render :new, status: :unprocessable_entity}
                    format.json {render json: @user.errors, status: :unprocessable_entity }
                end
            end
        end
    
        def destroy
            @user.destroy
            respond_to do |format|
                format.html { redirect_to user_url, notice: "User was succesfully deleted" }
                format.json {head :no_content}
            end
        end
    
        private
        
        def set_user
            @user = User.find(params[:id])
        end
    
        def user_params
            params.require(:user).permit(:email, :password_digest, :first_name, :last_name, :user_id)
        end
end
