class NotesController < ApplicationController

    def new
        # byebug
        render :new_note
    end

    def index
        @users = User.all
    end

    # def create

    # end

    # def show

    # end

    # def edit

    # end

    # def update

    # end

    # def destroy

    # end

end
