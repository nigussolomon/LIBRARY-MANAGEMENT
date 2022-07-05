class StudentsController < ApplicationController
    before_action :set_student, only: %i[show edit update  destroy]

    def index
        @students = Student.all
        data = ActiveModelSerializers::SerializableResource.new(@students)
        render json: {success: true, data: data}
    end

    def new
        @student = Student.new
    end

    def show 
        render json: @student
    end

    def edit
    end
    
    def create
        @student= Student.new(student_params)

        if @student.save
            render json: @student, status: :created, location: @student
        else
            render json: @student.errors, status: :unprocessable_entity
        end
    end


    def update
        if @student.update(student_params)
            render json: @student
        else
            render json: @student.errors, status: :unprocessable_entity
        end
    end
    
    def destroy
        @student.destroy
    end
    
    private
        
    def set_student
        @student = Student.find(params[:id])
    end
    
    def student_params
        params.require(:student).permit(:year, :user, :semester)
    end
end
