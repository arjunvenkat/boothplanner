require "application_system_test_case"

class TaughtBiesTest < ApplicationSystemTestCase
  setup do
    @taught_by = taught_bies(:one)
  end

  test "visiting the index" do
    visit taught_bies_url
    assert_selector "h1", text: "Taught Bies"
  end

  test "creating a Taught by" do
    visit taught_bies_url
    click_on "New Taught By"

    fill_in "Course", with: @taught_by.course_id
    fill_in "Instructor", with: @taught_by.instructor_id
    click_on "Create Taught by"

    assert_text "Taught by was successfully created"
    click_on "Back"
  end

  test "updating a Taught by" do
    visit taught_bies_url
    click_on "Edit", match: :first

    fill_in "Course", with: @taught_by.course_id
    fill_in "Instructor", with: @taught_by.instructor_id
    click_on "Update Taught by"

    assert_text "Taught by was successfully updated"
    click_on "Back"
  end

  test "destroying a Taught by" do
    visit taught_bies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Taught by was successfully destroyed"
  end
end
