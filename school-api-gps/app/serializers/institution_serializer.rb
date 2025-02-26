class InstitutionSerializer < ActiveModel::Serializer
  attributes :id, :name

  attribute :students_count do
    object.students.count
  end
end
