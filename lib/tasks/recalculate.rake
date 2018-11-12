require 'csv'
namespace :recalculate do
  desc "Imports event guest data from a CSV"
  task all: :environment do
    puts "Recalculating data for course by profs..."
    CourseByProf.all.each do |cbp|
      cbp.instructors.map(&:name).join(", ")
      hours_per_week_by_section = cbp.sections.map(&:hours_per_week).compact
      hpw_sum = hours_per_week_by_section.inject(0.0){|sum, num| sum + num}
      hpw_count = hours_per_week_by_section.length
      cbp.hours_per_week = (hpw_sum/hpw_count).round(1)

      overall_rating_by_section = cbp.sections.map(&:overall).compact
      rating_sum = overall_rating_by_section.inject(0.0){|sum, num| sum + num}
      rating_count = overall_rating_by_section.length
      cbp.overall_rating = (rating_sum/rating_count).round(1)

      course_price_array = cbp.sections.map(&:phase_1_price).compact
      course_price_sum = course_price_array.inject(0.0){|sum, num| sum + num}
      course_price_count = course_price_array.length
      if course_price_count > 1
        cbp.course_price = (course_price_sum/course_price_count).round
      end

      cbp.course_title = cbp.course.title
      cbp.course_number = cbp.course.number
      cbp.instructors_string = cbp.instructors.map(&:name).join(",")
      cbp.instructor_ids = cbp.instructors.map(&:id).join(",")

      cbp.save
    end
    puts "Recalculated data for course by profs"
  end
end
