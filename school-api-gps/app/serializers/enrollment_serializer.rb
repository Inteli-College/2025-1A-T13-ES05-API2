class EnrollmentSerializer < ActiveModel::Serializer
  attributes :id, :shift

  belongs_to :institution, serializer: InstitutionSerializer
  belongs_to :course, serializer: CourseSerializer
end
