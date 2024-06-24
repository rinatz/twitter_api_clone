# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'ユーザーの一覧が取得できること' do
    get users_url, as: :json
    assert_response :success
  end

  test 'ユーザーが作成できること' do
    assert_difference('User.count') do
      post users_url, params: { user: { name: 'Charlie' } }, as: :json
    end

    assert_response :created
  end

  test 'ユーザーが取得できること' do
    get user_url(@user), as: :json
    assert_response :success
  end

  test '存在しないユーザーを取得しようとしたらエラーが返ること' do
    nonexistent_id = 0
    get user_url(nonexistent_id), as: :json
    assert_response :not_found
  end

  test 'ユーザーの名称が更新できること' do
    patch user_url(@user), params: { user: { name: 'Charlie' } }, as: :json
    assert_response :success
  end

  test 'ユーザーとユーザーに紐づく投稿が削除できること' do
    assert_difference('User.count', -1) do
      assert_difference('Post.count', -1) do
        delete user_url(@user), as: :json
      end
    end

    assert_response :no_content
  end

  test '存在しないユーザーを削除しようとしたらエラーが返ること' do
    nonexistent_id = 0
    delete user_url(nonexistent_id), as: :json
    assert_response :not_found
  end
end
