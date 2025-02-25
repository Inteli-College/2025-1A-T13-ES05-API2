class Enrollment < ApplicationRecord
  belongs_to :student
  belongs_to :institution
  belongs_to :course

  validates :shift, presence: true
end
