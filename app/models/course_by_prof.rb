class CourseByProf < ApplicationRecord
  belongs_to :course
  has_many :teachings, dependent: :destroy
  has_many :instructors, through: :teachings
  has_many :sections, dependent: :destroy
end
