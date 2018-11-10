require "application_system_test_case"

class EvalsTest < ApplicationSystemTestCase
  setup do
    @eval = evals(:one)
  end

  test "visiting the index" do
    visit evals_url
    assert_selector "h1", text: "Evals"
  end

  test "creating a Eval" do
    visit evals_url
    click_on "New Eval"

    fill_in "Clear", with: @eval.clear
    fill_in "Enrl", with: @eval.enrl
    fill_in "Hours Per Week", with: @eval.hours_per_week
    fill_in "Interesting", with: @eval.interesting
    fill_in "Num Responses", with: @eval.num_responses
    fill_in "Overall", with: @eval.overall
    fill_in "Percent Responded", with: @eval.percent_responded
    fill_in "Quarter", with: @eval.quarter
    fill_in "Reccommend", with: @eval.reccommend
    fill_in "Taught By", with: @eval.taught_by_id
    fill_in "Useful", with: @eval.useful
    fill_in "Year", with: @eval.year
    click_on "Create Eval"

    assert_text "Eval was successfully created"
    click_on "Back"
  end

  test "updating a Eval" do
    visit evals_url
    click_on "Edit", match: :first

    fill_in "Clear", with: @eval.clear
    fill_in "Enrl", with: @eval.enrl
    fill_in "Hours Per Week", with: @eval.hours_per_week
    fill_in "Interesting", with: @eval.interesting
    fill_in "Num Responses", with: @eval.num_responses
    fill_in "Overall", with: @eval.overall
    fill_in "Percent Responded", with: @eval.percent_responded
    fill_in "Quarter", with: @eval.quarter
    fill_in "Reccommend", with: @eval.reccommend
    fill_in "Taught By", with: @eval.taught_by_id
    fill_in "Useful", with: @eval.useful
    fill_in "Year", with: @eval.year
    click_on "Update Eval"

    assert_text "Eval was successfully updated"
    click_on "Back"
  end

  test "destroying a Eval" do
    visit evals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Eval was successfully destroyed"
  end
end
