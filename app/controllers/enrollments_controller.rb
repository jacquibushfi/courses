class EnrollmentsController < ApplicationController

  def new
    @enrollment = Enrollment.new
  end
  
  def create
    enrollment = @user.Enrollments.build(enrollment_params)
    redirect_to course
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:rating, :user_id, :course_id, course_params: [:id, :title] )
  end

end
