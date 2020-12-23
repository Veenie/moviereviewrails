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
        #redirect_if_not_logged_in
        #we use find_by rather than find because we get a nil result for our redirect
        @user = User.find_by_id(params[:id])
    end

    # def login
    # end

    # def logout
    # end    

    private

    def user_params
       params.require(:user).permit(:name, :password)
    end



end
