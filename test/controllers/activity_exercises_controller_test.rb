require "test_helper"

class ActivityExercisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @activity_exercise = activity_exercises(:one)
  end

  test "should get index" do
    get activity_exercises_url, as: :json
    assert_response :success
  end

  test "should create activity_exercise" do
    assert_difference("ActivityExercise.count") do
      post activity_exercises_url, params: { activity_exercise: { activity_id: @activity_exercise.activity_id, exercise_id: @activity_exercise.exercise_id } }, as: :json
    end

    assert_response :created
  end

  test "should show activity_exercise" do
    get activity_exercise_url(@activity_exercise), as: :json
    assert_response :success
  end

  test "should update activity_exercise" do
    patch activity_exercise_url(@activity_exercise), params: { activity_exercise: { activity_id: @activity_exercise.activity_id, exercise_id: @activity_exercise.exercise_id } }, as: :json
    assert_response :success
  end

  test "should destroy activity_exercise" do
    assert_difference("ActivityExercise.count", -1) do
      delete activity_exercise_url(@activity_exercise), as: :json
    end

    assert_response :no_content
  end
end
