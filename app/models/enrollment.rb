class Enrollment < ApplicationRecord

  belongs_to :user
  belongs_to :course
  
  validates :rating, presence: true
  validates_inclusion_of :rating, :in => 1..5
end
