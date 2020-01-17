class EnrollmentsController < ApplicationController

  def new
    @enrollment = current_user.enrollments.build
    @course = Course.find_by(id: params[:course_id])
  end
  
  def create
    @enrollment = current_user.enrollments.build(enrollment_params)
    @course = Course.find_by(id: params[:course_id])
    
    if @enrollment.save
       redirect_to courses_path
    else
       render :new
    end
  end

  def edit
    @enrollment = Enrollment.find_by(id: params[:id])
  end

  def update
  end

    private

  def enrollment_params
    params.require(:enrollment).permit(:rating, :user_id, :course_id, :id )
  end

end
