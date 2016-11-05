require 'test_helper'

class SeriesfranchisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @seriesfranchise = seriesfranchises(:one)
  end

  test "should get index" do
    get seriesfranchises_url
    assert_response :success
  end

  test "should get new" do
    get new_seriesfranchise_url
    assert_response :success
  end

  test "should create seriesfranchise" do
    assert_difference('Seriesfranchise.count') do
      post seriesfranchises_url, params: { seriesfranchise: { franchise_id: @seriesfranchise.franchise_id, series_id: @seriesfranchise.series_id } }
    end

    assert_redirected_to seriesfranchise_url(Seriesfranchise.last)
  end

  test "should show seriesfranchise" do
    get seriesfranchise_url(@seriesfranchise)
    assert_response :success
  end

  test "should get edit" do
    get edit_seriesfranchise_url(@seriesfranchise)
    assert_response :success
  end

  test "should update seriesfranchise" do
    patch seriesfranchise_url(@seriesfranchise), params: { seriesfranchise: { franchise_id: @seriesfranchise.franchise_id, series_id: @seriesfranchise.series_id } }
    assert_redirected_to seriesfranchise_url(@seriesfranchise)
  end

  test "should destroy seriesfranchise" do
    assert_difference('Seriesfranchise.count', -1) do
      delete seriesfranchise_url(@seriesfranchise)
    end

    assert_redirected_to seriesfranchises_url
  end
end
