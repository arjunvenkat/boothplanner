class Section < ApplicationRecord
  belongs_to :course
  belongs_to :course_by_prof
end
