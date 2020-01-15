class EnrollmentsController < ApplicationController
  
  def create
    enrollment = @course.Enrollments.build(enrollment_params)
    redirect_to enrollment.post
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:rating, :user_id, :course_id, user_attributes: [:id])
  end

end
