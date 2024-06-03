require "test_helper"

class TabletsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tablet = tablets(:one)
  end

  test "should get index" do
    get tablets_url, as: :json
    assert_response :success
  end

  test "should create tablet" do
    assert_difference("Tablet.count") do
      post tablets_url, params: { tablet: { model: @tablet.model, state: @tablet.state } }, as: :json
    end

    assert_response :created
  end

  test "should show tablet" do
    get tablet_url(@tablet), as: :json
    assert_response :success
  end

  test "should update tablet" do
    patch tablet_url(@tablet), params: { tablet: { model: @tablet.model, state: @tablet.state } }, as: :json
    assert_response :success
  end

  test "should destroy tablet" do
    assert_difference("Tablet.count", -1) do
      delete tablet_url(@tablet), as: :json
    end

    assert_response :no_content
  end
end
