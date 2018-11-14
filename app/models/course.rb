class Course < ApplicationRecord
  has_many :course_by_profs, dependent: :destroy
  has_many :sections, dependent: :destroy

  validates :number, uniqueness: true
end
