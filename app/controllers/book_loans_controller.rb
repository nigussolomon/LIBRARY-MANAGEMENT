class BookLoansController < ApplicationController
    before_action :set_book_loan, only: %i[show edit update  destroy]

    def index
        @book_loans = BookLoan.all
        data = ActiveModelSerializers::SerializableResource.new(@book_loans)
        render json: { success: true, data: data }
    end

    def new
        @book_loans= BookLoan.new
    end

    def show 
        render json: @book_loan
    end

    def edit
    end
    
    def create
        @book_loan = BookLoan.new(book_loan_params)

        if @book_loan.save
            render json: @book_loan, status: :created, location: @book_loan
        else
            render json: @book_loan.errors, status: :unprocessable_entity
        end
    end


    def update
        if @book_loan.update(book_loan_params)
            render json: @book_loan
        else
            render json: @book_loan.errors, status: :unprocessable_entity 
        end
    end

    
    def destroy
        @book_loan.destroy
    end
    
    private
        
    def set_book_loan
        @book_loan = BookLoan.find(params[:id])
    end
    
    def book_loan_params
        params.require(:book_loan).permit(:book, :user, :due_date, :loan_date, :status)
    end

end
