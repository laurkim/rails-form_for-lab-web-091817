class SchoolClassesController < ApplicationController
  before_action :school_class, only: [:show, :edit, :update]

  def new
    @school_class = SchoolClass.new
  end

  def create
    # byebug
    @school_class = SchoolClass.create(school_class_params(:title, :room_number))
    redirect_to school_class_path(@school_class)
  end

  def show
  end

  def edit
  end

  def update
    # byebug
    @school_class.update(params.require(:school_class))
    redirect_to school_class_path(@school_class)
  end

  private

    def school_class
      @school_class = SchoolClass.find(params[:id])
    end

    def school_class_params(*args)
      params.require(:school_class).permit(*args)
    end

end
