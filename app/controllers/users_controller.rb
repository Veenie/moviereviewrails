class UsersController < ApplicationController

    
    def new
        @user = User.new
    end

    def create
        @user =User.new(user_params)
        if @user.save
            #log in
            session[:user_id] = @user.id
            #redirect to show
            redirect_to @user

        else
          @errors = @user.errors.full_messages
          render :new  
        end

    end
    
    def show
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

    private

    def user_params
       params.require(:user).permit(:name, :password)
    end



end
