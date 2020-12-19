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
        #we use find_by rather than find because we get a nil result for our redirect
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
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
