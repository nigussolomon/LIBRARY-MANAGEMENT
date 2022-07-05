class InstructorsController < ApplicationController
    before_action :set_Instrutor, only: %i[ show edit update destroy ]


    def index
        @instructors = Instructor.all
    end 

    def show
    end

    def new
        @Instructor = Instructor.new
    end

    def edit
    end
    def create
        @Instructor = Instructor.new(instructor_params)

        respond_to do |format|
            if @Instructor.save
                format.html { redirect_to book_url(@instructor), notice: "Instructor was successfully created." }
                format.json { render :show, status: :created, location: @instructor }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @instructor.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @book.update(instructor_params)
                format.html { redirect_to instructor_url(@instructor, notice: "Instructor was successfully updated." )}
                format.json { render :show, status: :ok, location: @instructor }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @instructor.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @instructor.destroy
        respond_to do |format|
            format.html { redirect_to books_url, notice: "instructor was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private

    def set_instructor
        @instructor = Instructor.find(params[:id])
    end

    def instrutor_params
        params.require(:instructor).permit(:user, :course)
    end

end
 

end
