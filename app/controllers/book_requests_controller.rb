class BookRequestsController < ApplicationController
    before_action :set_book_request, only: %i[show edit update  destroy]

    def index
        @book_requests = BookRequest.all
        data = ActiveModelSerializers::SerializableResource.new(@book_requests)
        render json: { success: true, data: data }
    end

    def new
        @book_requests= BookRequest.new
    end

    def show 
        render json: @book_request
    end

    def edit
    end
    
    def create
        @book_request = BookRequest.new(book_request_params)

        if @book_request.save
            render json: @book_request, status: :created, location: @book_request
        else
            render json: @book_request.errors, status: :unprocessable_entity
        end
    end


    def update
        if @book_request.update(book_request_params)
            render json: @book_request
        else
            render json: @book_request.errors, status: :unprocessable_entity 
        end
    end

    
    def destroy
        @book_request.destroy
    end
    
    private
        
    def set_book_request
        @book_request = BookRequest.find(params[:id])
    end
    
    def book_request_params
        params.require(:book_request).permit(:user, :title, :author, :publisher, :published_date, :category, :isbn, :status)
    end
end
