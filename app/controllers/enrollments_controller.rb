class EnrollmentsController < ApplicationController

  def new
    @enrollment = Enrollment.new
    
    @course = Course.find_by(id: params[:course_id])
    #raise params.inspect
  end
  
  def create
     #raise params.inspect
    enrollment = current_user.enrollments.build(enrollment_params)
    enrollment.save
    redirect_to courses_path
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:rating, :user_id, :course_id, course_params: [:id, :title] )
  end

end
