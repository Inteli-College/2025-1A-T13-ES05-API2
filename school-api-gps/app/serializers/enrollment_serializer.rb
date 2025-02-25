# app/serializers/enrollment_serializer.rb
class EnrollmentSerializer < ActiveModel::Serializer
  attributes :id, :shift, :start_date, :end_date, :status, :institution_name, :course_name, :course_type

  def institution_name
    object.institution.name if object.institution
  end

  def course_name
    object.course.name if object.course
  end

  def course_type
    object.course.course_type if object.course
  end
end
