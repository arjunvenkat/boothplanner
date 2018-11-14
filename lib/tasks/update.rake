require 'csv'
namespace :update do
  desc "Imports event guest data from a CSV"
  task all: :environment do
    puts "Updating data for course by profs..."
    CourseByProf.all.each do |cbp|
      hours_per_week_by_section = cbp.sections.map(&:hours_per_week).compact
      hpw_sum = hours_per_week_by_section.inject(0.0){|sum, num| sum + num}
      hpw_count = hours_per_week_by_section.length
      if hpw_count > 0
        cbp.hours_per_week = (hpw_sum/hpw_count).round(1)
      else
        cbp.hours_per_week = nil
      end

      overall_rating_by_section = cbp.sections.map(&:overall).compact
      rating_sum = overall_rating_by_section.inject(0.0){|sum, num| sum + num}
      rating_count = overall_rating_by_section.length
      if rating_count > 0
        cbp.overall_rating = (rating_sum/rating_count).round(1)
      else
        cbp.overall_rating = nil
      end

      course_price_array = cbp.sections.map(&:phase_1_price).compact
      # course_price_sum = course_price_array.inject(0.0){|sum, num| sum + num}
      course_price_count = course_price_array.length
      if course_price_count > 0
        # cbp.course_price = (course_price_sum/course_price_count).round
        cbp.course_price = course_price_array.max
      else
        cbp.course_price = nil
      end

      overall_clear_by_section = cbp.sections.map(&:clear).compact
      clear_sum = overall_clear_by_section.inject(0.0){|sum, num| sum + num}
      clear_count = overall_clear_by_section.length
      if clear_count > 0
        cbp.clear = (clear_sum/clear_count).round(1)
      else
        cbp.clear = nil
      end

      overall_interesting_by_section = cbp.sections.map(&:interesting).compact
      interesting_sum = overall_interesting_by_section.inject(0.0){|sum, num| sum + num}
      interesting_count = overall_interesting_by_section.length
      if interesting_count > 0
        cbp.interesting = (interesting_sum/interesting_count).round(1)
      else
        cbp.interesting = nil
      end

      overall_useful_by_section = cbp.sections.map(&:useful).compact
      useful_sum = overall_useful_by_section.inject(0.0){|sum, num| sum + num}
      useful_count = overall_useful_by_section.length
      if useful_count > 0
        cbp.useful = (useful_sum/useful_count).round(1)
      else
        cbp.useful = nil
      end

      overall_reccommend_by_section = cbp.sections.map(&:reccommend).compact
      reccommend_sum = overall_reccommend_by_section.inject(0.0){|sum, num| sum + num}
      reccommend_count = overall_reccommend_by_section.length
      if reccommend_count > 0
        cbp.reccommend = (reccommend_sum/reccommend_count).round(1)
      else
        cbp.reccommend = nil
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
