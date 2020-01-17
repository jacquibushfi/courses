class Enrollment < ApplicationRecord

  belongs_to :user
  belongs_to :course

  validates_uniqueness_of :user_id, scope: :course_id, message: "You have already rated this course."
  validates :rating, presence: true
  validates_inclusion_of :rating, :in => 1..5

  accepts_nested_attributes_for :course
end
