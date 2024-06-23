# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @post = posts(:one)
  end

  test 'should get index' do
    get user_posts_url(@user), as: :json
    assert_response :success
  end

  test 'should create post' do
    assert_difference('Post.count') do
      post user_posts_url(@user), params: { post: { content: @post.content } }, as: :json
    end

    assert_response :created
  end

  test 'should show post' do
    get user_post_url(@user, @post), as: :json
    assert_response :success
  end

  test 'should update post' do
    patch user_post_url(@user, @post), params: { post: { content: @post.content } }, as: :json
    assert_response :success
  end

  test 'should destroy post' do
    assert_difference('Post.count', -1) do
      delete user_post_url(@user, @post), as: :json
    end

    assert_response :no_content
  end
end
