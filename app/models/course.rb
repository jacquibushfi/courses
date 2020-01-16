class Course < ApplicationRecord

  has_many :enrollments
  has_many :users, through: :enrollments

  validates :title, :category, presence: true
  validates :title,  uniqueness: true

  scope :glass, -> { where(category: "Glass") }
  scope :jewelry, -> { where(category: "Jewelry") }
  
  
end
