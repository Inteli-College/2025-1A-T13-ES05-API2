class Course < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :students, through: :enrollments

  validates :name, :course_type, presence: true
end
