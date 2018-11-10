require 'test_helper'

class TaughtBiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @taught_by = taught_bies(:one)
  end

  test "should get index" do
    get taught_bies_url
    assert_response :success
  end

  test "should get new" do
    get new_taught_by_url
    assert_response :success
  end

  test "should create taught_by" do
    assert_difference('TaughtBy.count') do
      post taught_bies_url, params: { taught_by: { course_id: @taught_by.course_id, instructor_id: @taught_by.instructor_id } }
    end

    assert_redirected_to taught_by_url(TaughtBy.last)
  end

  test "should show taught_by" do
    get taught_by_url(@taught_by)
    assert_response :success
  end

  test "should get edit" do
    get edit_taught_by_url(@taught_by)
    assert_response :success
  end

  test "should update taught_by" do
    patch taught_by_url(@taught_by), params: { taught_by: { course_id: @taught_by.course_id, instructor_id: @taught_by.instructor_id } }
    assert_redirected_to taught_by_url(@taught_by)
  end

  test "should destroy taught_by" do
    assert_difference('TaughtBy.count', -1) do
      delete taught_by_url(@taught_by)
    end

    assert_redirected_to taught_bies_url
  end
end
