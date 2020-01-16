class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    course = Course.create(course_params)
    redirect_to courses_path  
  end

  def index
    @courses = Course.all 
  end


private

  def course_params
    params.require(:course).permit(:title, :description, :category, :id)
  end


end
