class StudentSerializer < ActiveModel::Serializer
  attributes :id, :academic_id, :name, :email, :date_of_birth, :contact_phone

  has_many :enrollments, serializer: EnrollmentSerializer
end
