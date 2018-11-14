class Section < ApplicationRecord
  belongs_to :course
  belongs_to :course_by_prof

  validates :course_id, uniqueness: { scope: [:number, :quarter, :year], message: "Must have a unique combination of course, section number, quarter and year" }
end
