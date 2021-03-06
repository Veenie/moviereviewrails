class SessionsController < ApplicationController
    def home
    end

    def create
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Incorrect login info, please try again"
            redirect_to '/login'
        end
    end

    def g_login
        user = User.find_or_create_by(name: auth['email']) do |u|
            u.password = SecureRandom.hex(10)
        end
        session[:user_id] = user.id
        redirect_to user_path(user)

    end

    def destroy
        session.clear
        redirect_to '/'
    end
   

    private

    def auth
        request.env['omniauth.auth']['info']
    end


end        