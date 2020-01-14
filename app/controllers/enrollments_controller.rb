class EnrollmentsController < ApplicationController
  
  def create
    enrollment = Enrollment.create(enrollment_params)
    redirect_to enrollment.post
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:rating, :user_id, :course_id, user_attributes:[:username])
  end

end
