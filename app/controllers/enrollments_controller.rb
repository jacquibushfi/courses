class EnrollmentsController < ApplicationController

  def new
    @enrollment = current_user.enrollments.build
    @course = Course.find_by(id: params[:course_id])

    #raise params.inspect
  end
  
  def create
     #raise params.inspect

    @enrollment = current_user.enrollments.build(enrollment_params)
    @course = Course.find_by(id: params[:course_id])
    #binding.pry
    if @enrollment.save
       redirect_to courses_path
    else
      #raise @course.inspect
      render :new
    end
    
  end

    private

  def enrollment_params
    params.require(:enrollment).permit(:rating, :user_id, :course_id )
  end

end
