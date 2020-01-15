class Course < ApplicationRecord

  has_many :enrollments
  has_many :users, through: :enrollments

  validates :title, :category, presence: true
  validates :title,  uniqueness: true

  accepts_nested_attributes_for :enrollments,  reject_if: lambda {|attributes| attributes['rating'].blank?}
  
end
