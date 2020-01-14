class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def index
    @courses = Course.all 

  end

  def create
    course = Course.create(course_params)
  end

  def show
    @course = Course.find_by(params[:id])
  end

private

  def course_params
    params.require(:course).permit(:title, :description, :category)
  end


end
