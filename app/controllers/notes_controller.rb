class NotesController < ApplicationController

    def new
        @note = Note.new
    end

    def create
        @note = Note.new(title: params[:note][:title], user_id: session[:user_id], description: params[:note][:description])
        # byebug
        if @note.save
            redirect_to profile_path
        else
            render :new
        end
    end

    def show
        @note = Note.find(params[:id])
    end

    def edit
        @note = Note.find(params[:id])
    end

    def update
        @note = Note.find(params[:id])
        # byebug
        if @note.update(title: params[:note][:title], description: params[:note][:description])
            redirect_to profile_path
        else 
            render :edit
        end
    end

    def destroy
        @note = Note.find(params[:id])
        @note.destroy

        redirect_to profile_path
    end

end
