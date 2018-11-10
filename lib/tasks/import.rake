require 'csv'
namespace :import do
  desc "Imports event guest data from a CSV"
  task evals: :environment do
    CSV.foreach("#{Rails.root}/db/data/course_evals.csv", headers: true) do |row|
    # course = Course.find_or_create_by(number: row["Course"], title: row["Title"])
    if row["Instructor"].include?("co-taught")
      fi
      puts row["Instructor"]
    end
    # instructor_last = row["Instructor"].split(",")[0].strip
    # instructor_first = row["Instructor"].split(",")[1].strip

    # puts instructor_first.inspect
    # puts instructor_last.inspect
    # instructor = Instructor.
    # puts row["Course"]
    # puts row["Title"]
    # puts row["Instructor"]
    # puts row["QTR"]
    # puts row["YR"]
    # puts row["ENRL"]
    # puts row["Responses"]
    # puts row["% RESP"]
    # puts row["Q. 1 HRS /WK"]
    # puts row["Q. 2 CONVEY CLEAR"]
    # puts row["Q. 3 CONVEY INTRST"]
    # puts row["Q. 4 USEFUL TOOLS"]
    # puts row["Q. 5 OUT OF COURSE"]
    # puts row["Q. 6 REC COURSE"]
    #   existing_project = Project.find_by(lesson_number: row[0])
    #   if existing_project.blank?
    #     course_id = Course.find_by(name: row[2]).try(:id)
    #     if row[13].present?
    #       slides_created = false
    #     else
    #       slides_created = true
    #     end
    #     project = Project.create({
    #       lesson_number: row[0],
    #       name: row[1],
    #       course_id: course_id,
    #       platform: row[3],
    #       skill_level: row[4],
    #       age_group: row[5],
    #       activity_type: row[6],
    #       equipment: row[7],
    #       project_file: row[8],
    #       starter_kit: row[9],
    #       notes: row[10],
    #       slides_created: slides_created
    #     })
    #     puts "#{project.lesson_number} - #{project.name} created"
    #   else
    #     puts "#{existing_project.lesson_number} - #{existing_project.name} already exists"
    #   end
    # end
    end
    puts "There are #{Eval.count} course evals in the database"
  end
end
