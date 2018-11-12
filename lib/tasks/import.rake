require 'csv'
namespace :import do
  desc "Imports section data from CSV"
  task sections: :environment do
    puts "Destroying sections, instructions and course_by_profs..."
    Section.destroy_all
    Instructor.destroy_all
    CourseByProf.destroy_all
    CSV.foreach("#{Rails.root}/db/data/course_evals.csv", headers: true) do |row|
      course = Course.find_or_create_by(number: row["Course"], title: row["Title"])

      existing_section = Section.find_by(
        course_id: course.id,
        number: row["SECT"],
        quarter: row["QTR"],
        year: row["YR"]
      )
      instructor_ids = []
      if row["Instructor"].include?("co-taught")
        first_instructor = row["Instructor"].split("(co-taught with")[0].strip
        other_instructors_array = row["Instructor"].chomp(")").split("(co-taught with")[1].split(";")
        instructor_ids.push(Instructor.find_or_create_by(
          first_name: first_instructor.split(",")[1].strip,
          last_name: first_instructor.split(",")[0].strip
        ).id)
        other_instructors_array.each do |other_instructor_string|
          instructor_ids.push(Instructor.find_or_create_by(
            first_name: other_instructor_string.split(",")[1].strip,
            last_name: other_instructor_string.split(",")[0].strip
          ).id)
        end
      else
        instructor_ids.push(Instructor.find_or_create_by(
          first_name: row["Instructor"].split(",")[1].strip,
          last_name: row["Instructor"].split(",")[0].strip
        ).id)
      end

      course_by_prof = CourseByProf.joins(:teachings).where(
        course_id: course.id,
        teachings: { instructor_id: instructor_ids }
      ).first
      if course_by_prof.blank?
        course_by_prof = CourseByProf.create(
          course_id: course.id
        )
        instructor_ids.each do |instructor_id|
          Teaching.create(course_by_prof_id: course_by_prof.id, instructor_id: instructor_id)
        end
      end
      if existing_section.blank?
        section = Section.create(
          number: row["SECT"],
          course_id: course.id,
          course_by_prof_id: course_by_prof.id,
          quarter: row["QTR"],
          year: row["YR"],
          enrl: row["ENRL"],
          num_responses: row["RESPONSES"],
          percent_responded: row["% RESP"],
          hours_per_week: row["Q. 1 HRS /WK"],
          clear: row["Q. 2 CONVEY CLEAR"],
          interesting: row["Q. 3 CONVEY INTRST"],
          useful: row["Q. 4 USEFUL TOOLS"],
          overall: row["Q. 5 OUT OF COURSE"],
          reccommend: row["6 REC COURSE"],
        )
        puts "#{section.course.number}-#{section.number} #{section.quarter} #{section.year} #{section.course.title} created"
        puts "Taught by: #{section.course_by_prof.instructors.map(&:name).join(', ')}"
        puts
      else
        existing_section.update_attributes(
          number: row["SECT"],
          course_id: course.id,
          course_by_prof_id: course_by_prof.id,
          quarter: row["QTR"],
          year: row["YR"],
          enrl: row["ENRL"],
          num_responses: row["RESPONSES"],
          percent_responded: row["% RESP"],
          hours_per_week: row["Q. 1 HRS /WK"],
          clear: row["Q. 2 CONVEY CLEAR"],
          interesting: row["Q. 3 CONVEY INTRST"],
          useful: row["Q. 4 USEFUL TOOLS"],
          overall: row["Q. 5 OUT OF COURSE"],
          reccommend: row["6 REC COURSE"],
        )
      end
    end
    puts "There are #{Section.count} sections in the database"
  end

  desc "Imports coure price history data from CSV"
  task price_history: :environment do
    CSV.foreach("#{Rails.root}/db/data/course_price_history.csv", headers: true) do |row|
      puts "number: #{row["Course"].split("-")[0]}"
      puts "section: #{row["Course"].split("-")[1]}"
      puts "title: #{row["Title"].split("⑤")[0].strip}"
      puts "quarter: #{row["Quarter"].upcase[0..2]}"
      puts "year: #{row["Year"]}"
      puts "phase 1 enrollment: #{row["Total Enrollment after  Phase 1"]}"
      puts "seats available after phase 1: #{row["Seats Available after Phase 1"]}"
      puts "phase 1 price: #{row["Phase 1 Price"]}"
      puts "phase 2 enrollment: #{row["Total Enrollment after  Phase 2"]}"
      puts "seats available after phase 2: #{row["Seats Available after Phase 2"]}"
      puts "phase 2 price: #{row["Phase 2 Price"]}"
      puts "phase 3 enrollment: #{row["Total Enrollment after  Phase 3"]}"
      puts "seats available after phase 3: #{row["Seats Available after Phase 3"]}"
      puts "phase 3 price: #{row["Phase 3 Price"]}"
      puts "phase 4 enrollment: #{row["Total Enrollment after  Phase 4"]}"
      puts "seats available after phase 4: #{row["Seats Available after Phase 4"]}"
      puts "phase 4 price: #{row["Phase 4 Price"]}"
      # if row["Day and Time"].present?
      #   if row["Day and Time"].count(",") == 2
      #     puts "day: #{row["Day and Time"].split(",")[0].strip}, #{row["Day and Time"].split(",")[1].strip}"
      #     puts "start_time: #{row["Day and Time"].split(",")[2].split("-")[0].strip}"
      #     puts "end_time: #{row["Day and Time"].split(",")[2].split("-")[1].strip}"
      #   else
      #     puts "day: #{row["Day and Time"].split(",")[0].strip}"
      #     puts "start_time: #{row["Day and Time"].split(",")[1].split("-")[0].strip}"
      #     puts "end_time: #{row["Day and Time"].split(",")[1].split("-")[1].strip}"
      #   end
      # end
      course = Course.find_or_create_by(
        number: row["Course"].split("-")[0],
        title: row["Title"].split("⑤")[0].strip
      )
      section = Section.where(
        number: row["Course"].split("-")[1],
        course_id: course.id,
        quarter: row["Quarter"].upcase[0..2],
        year: row["Year"],
      ).first
      if section.blank?
        instructor_ids = []
        row["Instructor"].split(";").each do |instructor_string|
          instructor_ids.push(Instructor.find_or_create_by(
            last_name: instructor_string.split(",")[0].strip,
            first_name: instructor_string.split(",")[1].strip,
          ).id)
        end
        course_by_prof = CourseByProf.joins(:teachings).where(
          course_id: course.id,
          teachings: { instructor_id: instructor_ids }
        ).first
        if course_by_prof.blank?
          course_by_prof = CourseByProf.create(
            course_id: course.id
          )
          instructor_ids.each do |instructor_id|
            Teaching.create(course_by_prof_id: course_by_prof.id, instructor_id: instructor_id)
          end
        end
        section = Section.create(
          number: row["Course"].split("-")[1],
          course_id: course.id,
          course_by_prof_id: course_by_prof.id,
          quarter: row["Quarter"].upcase[0..2],
          year: row["Year"],
        )
      end
      section.update_attributes(
        phase_1_enrollment: row["Total Enrollment  after Phase 1"],
        phase_1_seats_available: row["Seats Available after Phase 1"],
        phase_1_price: row["Phase 1 Price"],
        phase_2_enrollment: row["Total Enrollment  after Phase 2"],
        phase_2_seats_available: row["Seats Available after Phase 2"],
        phase_2_price: row["Phase 2 Price"],
        phase_3_enrollment: row["Total Enrollment  after Phase 3"],
        phase_3_seats_available: row["Seats Available after Phase 3"],
        phase_3_price: row["Phase 3 Price"],
        phase_4_enrollment: row["Total Enrollment  after Phase 4"],
        phase_4_seats_available: row["Seats Available after Phase 4"],
        phase_4_price: row["Phase 4 Price"],
      )
      puts section.inspect
    end
  end
end
