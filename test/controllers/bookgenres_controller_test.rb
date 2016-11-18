require 'test_helper'

class BookgenresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bookgenre = bookgenres(:one)
  end

  test 'should get index' do
    get bookgenres_url
    assert_response :success
  end

  test 'should get new' do
    get new_bookgenre_url
    assert_response :success
  end

  test 'should create bookgenre' do
    assert_difference('Bookgenre.count') do
      post bookgenres_url, params: { bookgenre: { book_id: @bookgenre.book_id, genre_id: @bookgenre.genre_id } }
    end

    assert_redirected_to bookgenre_url(Bookgenre.last)
  end

  test 'should show bookgenre' do
    get bookgenre_url(@bookgenre)
    assert_response :success
  end

  test 'should get edit' do
    get edit_bookgenre_url(@bookgenre)
    assert_response :success
  end

  test 'should update bookgenre' do
    patch bookgenre_url(@bookgenre), params: { bookgenre: { book_id: @bookgenre.book_id, genre_id: @bookgenre.genre_id } }
    assert_redirected_to bookgenre_url(@bookgenre)
  end

  test 'should destroy bookgenre' do
    assert_difference('Bookgenre.count', -1) do
      delete bookgenre_url(@bookgenre)
    end

    assert_redirected_to bookgenres_url
  end
end
