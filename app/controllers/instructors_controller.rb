class InstructorsController < ApplicationController
    before_action :set_instructor, only: %i[ show edit update destroy ]


    def index
        @instructors = Instructor.all
        data = ActiveModelSerializers::SerializableResource.new(@instructors)
        render json: { success: true , data: data}
    end 

    def show
        render json: @instructor
    end

    def new
        @instructor = Instructor.new
    end

    def edit
    end

    def create
        @instructor = Instructor.new(instructor_params)

        if @instructor.save
            render json: @instructor, status: :created, location: @instructor
        else
            render json: @instructor.errors, status: :unprocessable_entity
        end
    end

    def update
        if @instructor.update(instructor_params)
            render json: @instructor
        else
            render json: @instructor.errors, status: :unprocessable_entity
        end
    end


    def destroy
        @instructor.destroy
    end

    private

    def set_instructor
        @instructor = Instructor.find(params[:id])
    end

    def instructor_params
        params.require(:instructor).permit(:user, :course)
    end

end
