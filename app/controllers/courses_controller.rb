class CoursesController < ApplicationController
  def new
    @course = Course.new
    @course.enrollments.build(user_id: current_user.id)
  end

  def create
    
    course = Course.create(course_params)
    binding.pry

    redirect_to courses_path  
  end

  def index
    @courses = Course.all 
  end


private

  def course_params
    params.require(:course).permit(:title, :description, :category, enrollments_attributes: [:rating, :user_id, :course_id])
  end


end
