class NotesController < ApplicationController

    def new
        @note = Note.new
        render :new_note
    end

    def index
        @users = Note.where(user_id: session[:user_id])
    end

    def create
        @note = Note.new(title: params[:note][:title], user_id: User.last.id, description: params[:note][:description])
        # byebug
        if @note.save
            redirect_to note_path(@note.id)
        else
            render :new_note
        end
    end

    def show
        @note = Note.find(params[:id])
        render :show_note
    end

    # def edit

    # end

    # def update

    # end

    # def destroy

    # end

end
