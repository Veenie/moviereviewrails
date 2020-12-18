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
          render :new  
        end  

    end
    
    def show
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
