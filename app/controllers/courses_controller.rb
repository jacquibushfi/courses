class CoursesController < ApplicationController
  def new
    @course = Course.new
    @course.enrollments.build
  end

  def index
    @courses = Course.all 

  end

  def create
    course = Course.create(course_params)
    
    redirect_to courses_path
  end

  def show
    @course = Course.find_by(params[:id])
  end

private

  def course_params
    params.require(:course).permit(:title, :description, :category, enrollments_attributes: [:course_id, :user_id, :rating])
  end


end
