class EnrollmentsController < ApplicationController

    before_action :set_course, only: [:new, :create]
    before_action :set_enrollment, only: [:edit, :update]

  def new
    @enrollment = current_user.enrollments.build
    
  end
  
  def create
    @enrollment = current_user.enrollments.build(enrollment_params)
    
    if @enrollment.save
       redirect_to courses_path
    else
       render :new
    end
  end

  def edit
  end

  def update 
    if @enrollment.update_attributes(enrollment_params)
      redirect_to courses_path
    else
      render :edit
    end
  end


private

  def enrollment_params
    params.require(:enrollment).permit(:rating, :user_id, :course_id, :id )
  end

  def set_course
    @course = Course.find_by(id: params[:course_id])
  end

  def set_enrollment
    @enrollment = current_user.enrollments.find_by(id: params[:id])
  end
  
end
