class Instructor < ApplicationRecord
  has_many :teachings, dependent: :destroy
  has_many :course_by_profs, through: :teachings
  has_many :courses, through: :course_by_profs
  def name
    "#{first_name} #{last_name}"
  end
end
