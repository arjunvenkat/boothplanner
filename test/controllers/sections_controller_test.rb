require 'test_helper'

class SectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @section = sections(:one)
  end

  test "should get index" do
    get sections_url
    assert_response :success
  end

  test "should get new" do
    get new_section_url
    assert_response :success
  end

  test "should create section" do
    assert_difference('Section.count') do
      post sections_url, params: { section: { clear: @section.clear, course_by_prof_id: @section.course_by_prof_id, course_id: @section.course_id, day: @section.day, end_time: @section.end_time, enrl: @section.enrl, hours_per_week: @section.hours_per_week, interesting: @section.interesting, num_responses: @section.num_responses, number: @section.number, overall: @section.overall, percent_responded: @section.percent_responded, phase_1_enrollment: @section.phase_1_enrollment, phase_1_price: @section.phase_1_price, phase_1_seats_available: @section.phase_1_seats_available, phase_2_enrollment: @section.phase_2_enrollment, phase_2_price: @section.phase_2_price, phase_3_enrollment: @section.phase_3_enrollment, phase_3_price: @section.phase_3_price, phase_3_seats_available: @section.phase_3_seats_available, phase_4_price: @section.phase_4_price, phase_4_seats_available: @section.phase_4_seats_available, phase_4_total_enrollment: @section.phase_4_total_enrollment, quarter: @section.quarter, reccommend: @section.reccommend, start_time: @section.start_time, useful: @section.useful, year: @section.year } }
    end

    assert_redirected_to section_url(Section.last)
  end

  test "should show section" do
    get section_url(@section)
    assert_response :success
  end

  test "should get edit" do
    get edit_section_url(@section)
    assert_response :success
  end

  test "should update section" do
    patch section_url(@section), params: { section: { clear: @section.clear, course_by_prof_id: @section.course_by_prof_id, course_id: @section.course_id, day: @section.day, end_time: @section.end_time, enrl: @section.enrl, hours_per_week: @section.hours_per_week, interesting: @section.interesting, num_responses: @section.num_responses, number: @section.number, overall: @section.overall, percent_responded: @section.percent_responded, phase_1_enrollment: @section.phase_1_enrollment, phase_1_price: @section.phase_1_price, phase_1_seats_available: @section.phase_1_seats_available, phase_2_enrollment: @section.phase_2_enrollment, phase_2_price: @section.phase_2_price, phase_3_enrollment: @section.phase_3_enrollment, phase_3_price: @section.phase_3_price, phase_3_seats_available: @section.phase_3_seats_available, phase_4_price: @section.phase_4_price, phase_4_seats_available: @section.phase_4_seats_available, phase_4_total_enrollment: @section.phase_4_total_enrollment, quarter: @section.quarter, reccommend: @section.reccommend, start_time: @section.start_time, useful: @section.useful, year: @section.year } }
    assert_redirected_to section_url(@section)
  end

  test "should destroy section" do
    assert_difference('Section.count', -1) do
      delete section_url(@section)
    end

    assert_redirected_to sections_url
  end
end
