class CoursesController < ApplicationController
  def new
    @course = Course.new
  end

  def create
    course = Course.create(course_params)
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
    params.require(:course).permit(:title, :description, :category, :id)
  end


end
