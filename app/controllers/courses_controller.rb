class CoursesController < ApplicationController
  

  def new
    @course = Course.new
  end

  def create
    @course = Course.create(course_params)
    if @course.save
      redirect_to courses_path  
    else
      render :new
    end
  end

  def index
    if params[:search]
      @courses = Course.where("title LIKE ?", params[:search])
      if Course.where("title LIKE ?", params[:search]).empty?
        @courses = Course.all
      end
   else
      @courses = Course.all
    end
  end

  def show
    @course = Course.find_by(id: params[:id])
  end



private

  def course_params
    params.require(:course).permit(:title, :description, :category, :id, :search)
  end

  

end
