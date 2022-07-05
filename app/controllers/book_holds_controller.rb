class BookHoldsController < ApplicationController
    before_action :set_book_hold, only: %i[ show edit update destroy ]

    def index 
        @book_holds= BookHold.all
    end

    def new
        @book_holds=BookHold.new
    end

    def show
    end

    def edit
    end

    def create
        @book_hold = BookHold.new(book_hold_params)

        respond_to do |format|
            
            if @book_hold.save
                format.html {redirect_to book_loan_url(@book_hold), notice: "Book Hold was succesfully created"}
                format.json {render :show, status: :created, location: @book_hold}
            else
                format.html {render :new, status: :unprocessable_entity}
                format.json {render json: @book_hold.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @book_hold.update(book_hold_params)
                format.html {redirect_to book_hold_url(@book_hold), notice: "Hold was succesfully updated"}
                format.json {render :show, status: :created, location: @book_hold}
            else
                format.html {render :new, status: :unprocessable_entity}
                format.json {render json: @book_hold.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @book_hold.destroy
        respond_to do |format|
            format.html { redirect_to book_holds_url, notice: "Hold was succesfully deleted" }
            format.json {head :no_content}
        end
    end

    private
    
    def set_book_hold
        @book_hold = BookHold.find(params[:id])
    end

    def book_hold_params
        params.require(:book_hold).permit(:book, :user, :hold_date, :request_date, :status)
    end

    

end
