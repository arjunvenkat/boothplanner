require "application_system_test_case"

class CourseByProfsTest < ApplicationSystemTestCase
  setup do
    @course_by_prof = course_by_profs(:one)
  end

  test "visiting the index" do
    visit course_by_profs_url
    assert_selector "h1", text: "Course By Profs"
  end

  test "creating a Course by prof" do
    visit course_by_profs_url
    click_on "New Course By Prof"

    fill_in "Course", with: @course_by_prof.course_id
    click_on "Create Course by prof"

    assert_text "Course by prof was successfully created"
    click_on "Back"
  end

  test "updating a Course by prof" do
    visit course_by_profs_url
    click_on "Edit", match: :first

    fill_in "Course", with: @course_by_prof.course_id
    click_on "Update Course by prof"

    assert_text "Course by prof was successfully updated"
    click_on "Back"
  end

  test "destroying a Course by prof" do
    visit course_by_profs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Course by prof was successfully destroyed"
  end
end
