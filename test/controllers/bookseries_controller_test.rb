require 'test_helper'

class BookseriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookseries = bookseries(:one)
  end

  test 'should get index' do
    get bookseries_index_url
    assert_response :success
  end

  test 'should get new' do
    get new_bookseries_url
    assert_response :success
  end

  test 'should create bookseries' do
    assert_difference('Bookseries.count') do
      post bookseries_index_url, params: { bookseries: { book_id: @bookseries.book_id, position: @bookseries.position, series_id: @bookseries.series_id } }
    end

    assert_redirected_to bookseries_url(Bookseries.last)
  end

  test 'should show bookseries' do
    get bookseries_url(@bookseries)
    assert_response :success
  end

  test 'should get edit' do
    get edit_bookseries_url(@bookseries)
    assert_response :success
  end

  test 'should update bookseries' do
    patch bookseries_url(@bookseries), params: { bookseries: { book_id: @bookseries.book_id, position: @bookseries.position, series_id: @bookseries.series_id } }
    assert_redirected_to bookseries_url(@bookseries)
  end

  test 'should destroy bookseries' do
    assert_difference('Bookseries.count', -1) do
      delete bookseries_url(@bookseries)
    end

    assert_redirected_to bookseries_index_url
  end
end
