require 'test_helper'

class CourseByProfsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_by_prof = course_by_profs(:one)
  end

  test "should get index" do
    get course_by_profs_url
    assert_response :success
  end

  test "should get new" do
    get new_course_by_prof_url
    assert_response :success
  end

  test "should create course_by_prof" do
    assert_difference('CourseByProf.count') do
      post course_by_profs_url, params: { course_by_prof: { course_id: @course_by_prof.course_id } }
    end

    assert_redirected_to course_by_prof_url(CourseByProf.last)
  end

  test "should show course_by_prof" do
    get course_by_prof_url(@course_by_prof)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_by_prof_url(@course_by_prof)
    assert_response :success
  end

  test "should update course_by_prof" do
    patch course_by_prof_url(@course_by_prof), params: { course_by_prof: { course_id: @course_by_prof.course_id } }
    assert_redirected_to course_by_prof_url(@course_by_prof)
  end

  test "should destroy course_by_prof" do
    assert_difference('CourseByProf.count', -1) do
      delete course_by_prof_url(@course_by_prof)
    end

    assert_redirected_to course_by_profs_url
  end
end
