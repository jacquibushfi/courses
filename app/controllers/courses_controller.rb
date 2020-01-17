class CoursesController < ApplicationController

  def new
    @course = Course.new
  end

  def create
    course = Course.create(course_params)
  #binding.pry
    if course.save
      redirect_to courses_path  
    else
      render :new
    end
  end

  def index
    @courses = Course.all 
  end

  def show
    # raise params.inspect
    @course = Course.find_by(id: params[:id])
  end



private

  def course_params
    params.require(:course).permit(:title, :description, :category, :id, user_attributes: [:id], enrollment_attributes: [:id, :rating] )
  end


end
