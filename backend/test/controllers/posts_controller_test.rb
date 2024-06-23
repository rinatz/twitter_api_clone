# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
  end

  test 'ユーザーの投稿の一覧が取得できること' do
    get user_posts_url(@user), as: :json
    assert_response :success
  end

  test '投稿できること' do
    assert_difference('Post.count') do
      post user_posts_url(@user), params: { post: { content: @post.content } }, as: :json
    end

    assert_response :created
  end

  test '存在しないユーザーの投稿の一覧を取得しようとしたらエラーが返ること' do
    nonexistent_id = 0
    get user_posts_url(nonexistent_id), as: :json
    assert_response :not_found
  end

  test 'ユーザーの投稿が取得できること' do
    get user_post_url(@user, @post), as: :json
    assert_response :success
  end

  test '存在しないユーザーの投稿を取得しようとしたらエラーが返ること' do
    nonexistent_id = 0
    get user_post_url(nonexistent_id, 1), as: :json
    assert_response :not_found
  end

  test '存在しない投稿を取得しようとしたらエラーが返ること' do
    nonexistent_id = 0
    get user_post_url(@user, nonexistent_id), as: :json
    assert_response :not_found
  end

  test 'ユーザーの投稿を更新できること' do
    patch user_post_url(@user, @post), params: { post: { content: @post.content } }, as: :json
    assert_response :success
  end

  test 'ユーザーの投稿を削除できること' do
    assert_difference('Post.count', -1) do
      delete user_post_url(@user, @post), as: :json
    end

    assert_response :no_content
  end

  test '存在しないユーザーの投稿を削除しようとしたらエラーが返ること' do
    nonexistent_id = 0
    delete user_post_url(nonexistent_id, 1), as: :json
    assert_response :not_found
  end

  test '存在しない投稿を削除しようとしたらエラーが返ること' do
    nonexistent_id = 0
    delete user_post_url(@user, nonexistent_id), as: :json
    assert_response :not_found
  end
end
