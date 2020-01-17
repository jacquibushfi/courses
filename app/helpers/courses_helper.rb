module CoursesHelper

  def user_enrollment(course)
    @enroll = Enrollment.where(course_id: course.id)
    @user_enroll = @enroll.find_by(user_id: current_user.id)
    @user_enroll
  end

end
