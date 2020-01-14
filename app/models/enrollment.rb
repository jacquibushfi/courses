class Enrollment < ApplicationRecord

  belongs_to :user
  belongs_to :course

  accepts_nested_attributes_for :course
  
  validates :rating, presence: true
  validates_inclusion_of :rating, :in => 1..5
end
