class UsersController < ApplicationController

    def show
        @notes = Note.where(user_id: session[:user_id])
    end

    def create
        @user = User.new(username: params[:username], password: params[:password])
        # byebug
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash.now[:message] = @user.errors.full_messages
            render :login
        end
    end

    def login
        render :login
    end

    def process_login
        @user = User.find_by(username: User.last.username)
        # byebug
        if @user && @user.authenticate(@user.password)
            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            flash.now[:message] = ["Username or password not found"]
            render :login
        end
    end

    def logout
        session.clear
        flash[:message] = "You have been logged out"
        redirect_to login_path
    end 

end
