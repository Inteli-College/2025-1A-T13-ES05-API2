class Student < ApplicationRecord
  has_many :enrollments, dependent: :destroy
  has_many :institutions, through: :enrollments
  has_many :courses, through: :enrollments

  validates :academic_id, :name, :email, :date_of_birth, :contact_phone, presence: true
end
