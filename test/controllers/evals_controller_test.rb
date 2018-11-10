require 'test_helper'

class EvalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eval = evals(:one)
  end

  test "should get index" do
    get evals_url
    assert_response :success
  end

  test "should get new" do
    get new_eval_url
    assert_response :success
  end

  test "should create eval" do
    assert_difference('Eval.count') do
      post evals_url, params: { eval: { clear: @eval.clear, enrl: @eval.enrl, hours_per_week: @eval.hours_per_week, interesting: @eval.interesting, num_responses: @eval.num_responses, overall: @eval.overall, percent_responded: @eval.percent_responded, quarter: @eval.quarter, reccommend: @eval.reccommend, taught_by_id: @eval.taught_by_id, useful: @eval.useful, year: @eval.year } }
    end

    assert_redirected_to eval_url(Eval.last)
  end

  test "should show eval" do
    get eval_url(@eval)
    assert_response :success
  end

  test "should get edit" do
    get edit_eval_url(@eval)
    assert_response :success
  end

  test "should update eval" do
    patch eval_url(@eval), params: { eval: { clear: @eval.clear, enrl: @eval.enrl, hours_per_week: @eval.hours_per_week, interesting: @eval.interesting, num_responses: @eval.num_responses, overall: @eval.overall, percent_responded: @eval.percent_responded, quarter: @eval.quarter, reccommend: @eval.reccommend, taught_by_id: @eval.taught_by_id, useful: @eval.useful, year: @eval.year } }
    assert_redirected_to eval_url(@eval)
  end

  test "should destroy eval" do
    assert_difference('Eval.count', -1) do
      delete eval_url(@eval)
    end

    assert_redirected_to evals_url
  end
end
