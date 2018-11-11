require 'csv'
namespace :recalculate do
  desc "Imports event guest data from a CSV"
  task all: :environment do
    puts "Recalculating data for course by profs..."
    CourseByProf.all.each do |cbp|
      cbp.instructors.map(&:name).join(", ")
      hours_per_week_by_section = cbp.sections.map(&:hours_per_week)
      hpw_sum = hours_per_week_by_section.inject(0.0){|sum, num| sum + num}
      hpw_count = hours_per_week_by_section.length
      cbp.hours_per_week = (hpw_sum/hpw_count).round(1)

      overall_rating_by_section = cbp.sections.map(&:overall)
      rating_sum = overall_rating_by_section.inject(0.0){|sum, num| sum + num}
      rating_count = overall_rating_by_section.length
      cbp.overall_rating = (rating_sum/rating_count).round(1)

      cbp.course_title = cbp.course.title
      cbp.course_number = cbp.course.number
      cbp.instructors_string = cbp.instructors.map(&:name).join(",")
      cbp.instructor_ids = cbp.instructors.map(&:id).join(",")

      cbp.save
    end
    puts "Recalculated data for course by profs"
  end
end
