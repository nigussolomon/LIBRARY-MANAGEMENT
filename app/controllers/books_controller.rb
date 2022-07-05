class BooksController < ApplicationController
    before_action :set_book, only: %i[ show edit update destroy ]


    def index
        @books = Book.all
        data = ActiveModelSerializers::SerializableResource.new(@books)
        render json: { success: true, data: data }
    end 

    def show
        render json: @book
    end

    def new
        @book = Book.new
    end

    def edit
    end
    def create
        @book = Book.new(book_params)

        if @book.save
            render json: @book, status: :created, location: @book
        else
            render json: @book.errors, status: :unprocessable_entity
        end
    end

    def update
        if @book.update(book_params)
            render json: @book
        else
            render json: @book.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @book.destroy
    end

    private

    def set_book
        @book = Book.find(params[:id])
    end

    def book_params
        params.require(:book).permit(:title, :author, :isbn, :publisher, :published_date, :category, :description, :copy, :status, :book_code)
    end

end