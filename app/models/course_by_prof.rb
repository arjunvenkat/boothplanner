class CourseByProf < ApplicationRecord
  belongs_to :course
  has_many :teachings
  has_many :instructors, through: :teachings
  has_many :sections
end
