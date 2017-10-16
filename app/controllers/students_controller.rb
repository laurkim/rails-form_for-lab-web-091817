class StudentsController < ApplicationController
  before_action :student, only: [:show, :edit, :update]

  def new
    @student = Student.new
  end

  def create
    # byebug
    @student = Student.create(student_params(:first_name, :last_name))
    redirect_to student_path(@student)
  end

  def show
  end

  def edit
  end

  def update
    @student.update(params.require(:student))
    redirect_to student_path(@student)
  end

  private

    def student
      @student = Student.find(params[:id])
    end

    def student_params(*args)
      params.require(:student).permit(*args)
    end

end
