class SessionsController < ApplicationController
    
    def new
    end
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_url, notice: "Log in successfull!"
        else
            flash.now.alert = "Invalid email password"
        end
    end
    
    def destroy
        session[:user_id] = nil
        redirect_to root_url, notice: "Successfully log out"
    end
end
