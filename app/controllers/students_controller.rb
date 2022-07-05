class StudentsController < ApplicationController
     before_action :set_student, only: %i[show edit update  destroy]

    def index
         @Student = Students.all
    end

    def new
        @student = Student.new
    end

    def show 
    end

    def edit
    end
    
    def create
        @student= Student.new(student_params)

        respond_to do |format|
            if @Student.save
                format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
                format.json { render :show, status: :created, location: @student }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @student.errors, status: :unprocessable_entity }
            end
        end


        def update
            respond_to do |format|
                if @student.update(student_params)
                    format.html {redirect_to student_url(@student), notice: "Student was succesfully updated"}
                    format.json {render :show, status: :created, location: @student}
                else
                    format.html {render :new, status: :unprocessable_entity}
                    format.json {render json: @student.errors, status: :unprocessable_entity }
                end
            end
        end
    
        def destroy
            @student.destroy
            respond_to do |format|
                format.html { redirect_to student_url, notice: "Student was succesfully deleted" }
                format.json {head :no_content}
            end
        end
    
        private
        
        def set_student
            @student = Student.find(params[:id])
        end
    
        def student_params
            params.require(:student).permit(:year, :user, :semester)
        end
end
