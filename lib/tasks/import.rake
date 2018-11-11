require 'csv'
namespace :import do
  desc "Imports event guest data from a CSV"
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
      if existing_section.blank?
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
      end
    end
    puts "There are #{Section.count} sections in the database"
  end
end
