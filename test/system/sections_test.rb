require "application_system_test_case"

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:one)
  end

  test "visiting the index" do
    visit sections_url
    assert_selector "h1", text: "Sections"
  end

  test "creating a Section" do
    visit sections_url
    click_on "New Section"

    fill_in "Clear", with: @section.clear
    fill_in "Course By Prof", with: @section.course_by_prof_id
    fill_in "Course", with: @section.course_id
    fill_in "Day", with: @section.day
    fill_in "End Time", with: @section.end_time
    fill_in "Enrl", with: @section.enrl
    fill_in "Hours Per Week", with: @section.hours_per_week
    fill_in "Interesting", with: @section.interesting
    fill_in "Num Responses", with: @section.num_responses
    fill_in "Number", with: @section.number
    fill_in "Overall", with: @section.overall
    fill_in "Percent Responded", with: @section.percent_responded
    fill_in "Phase 1 Enrollment", with: @section.phase_1_enrollment
    fill_in "Phase 1 Price", with: @section.phase_1_price
    fill_in "Phase 1 Seats Available", with: @section.phase_1_seats_available
    fill_in "Phase 2 Enrollment", with: @section.phase_2_enrollment
    fill_in "Phase 2 Price", with: @section.phase_2_price
    fill_in "Phase 3 Enrollment", with: @section.phase_3_enrollment
    fill_in "Phase 3 Price", with: @section.phase_3_price
    fill_in "Phase 3 Seats Available", with: @section.phase_3_seats_available
    fill_in "Phase 4 Price", with: @section.phase_4_price
    fill_in "Phase 4 Seats Available", with: @section.phase_4_seats_available
    fill_in "Phase 4 Total Enrollment", with: @section.phase_4_total_enrollment
    fill_in "Quarter", with: @section.quarter
    fill_in "recommend", with: @section.recommend
    fill_in "Start Time", with: @section.start_time
    fill_in "Useful", with: @section.useful
    fill_in "Year", with: @section.year
    click_on "Create Section"

    assert_text "Section was successfully created"
    click_on "Back"
  end

  test "updating a Section" do
    visit sections_url
    click_on "Edit", match: :first

    fill_in "Clear", with: @section.clear
    fill_in "Course By Prof", with: @section.course_by_prof_id
    fill_in "Course", with: @section.course_id
    fill_in "Day", with: @section.day
    fill_in "End Time", with: @section.end_time
    fill_in "Enrl", with: @section.enrl
    fill_in "Hours Per Week", with: @section.hours_per_week
    fill_in "Interesting", with: @section.interesting
    fill_in "Num Responses", with: @section.num_responses
    fill_in "Number", with: @section.number
    fill_in "Overall", with: @section.overall
    fill_in "Percent Responded", with: @section.percent_responded
    fill_in "Phase 1 Enrollment", with: @section.phase_1_enrollment
    fill_in "Phase 1 Price", with: @section.phase_1_price
    fill_in "Phase 1 Seats Available", with: @section.phase_1_seats_available
    fill_in "Phase 2 Enrollment", with: @section.phase_2_enrollment
    fill_in "Phase 2 Price", with: @section.phase_2_price
    fill_in "Phase 3 Enrollment", with: @section.phase_3_enrollment
    fill_in "Phase 3 Price", with: @section.phase_3_price
    fill_in "Phase 3 Seats Available", with: @section.phase_3_seats_available
    fill_in "Phase 4 Price", with: @section.phase_4_price
    fill_in "Phase 4 Seats Available", with: @section.phase_4_seats_available
    fill_in "Phase 4 Total Enrollment", with: @section.phase_4_total_enrollment
    fill_in "Quarter", with: @section.quarter
    fill_in "recommend", with: @section.recommend
    fill_in "Start Time", with: @section.start_time
    fill_in "Useful", with: @section.useful
    fill_in "Year", with: @section.year
    click_on "Update Section"

    assert_text "Section was successfully updated"
    click_on "Back"
  end

  test "destroying a Section" do
    visit sections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Section was successfully destroyed"
  end
end
