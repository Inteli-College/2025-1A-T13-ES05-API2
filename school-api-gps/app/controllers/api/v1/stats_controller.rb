class Api::V1::StatsController < Api::V1::BaseController
  def index
    total_students = Student.count
    total_enrollments = Enrollment.count
    total_courses = Course.count

    # Get a hash where keys are institution names and values are counts of enrollments.
    enrollments_per_institution = Institution.joins(:enrollments)
                                             .group("institutions.name")
                                             .count

    render json: {
      total_students: total_students,
      total_enrollments: total_enrollments,
      total_courses: total_courses,
      enrollments_per_institution: enrollments_per_institution
    }
  end
end
