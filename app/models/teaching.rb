class Teaching < ApplicationRecord
  belongs_to :course_by_prof
  belongs_to :instructor
end
