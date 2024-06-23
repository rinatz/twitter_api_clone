# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get index' do
    get users_url, as: :json
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_url, params: { user: { name: 'Alice' } }, as: :json
    end

    assert_response :created
  end

  test 'should show user' do
    get user_url(@user), as: :json
    assert_response :success
  end

  test 'should not update user name' do
    patch user_url(@user), params: { user: { name: @user.name } }, as: :json
    assert_response :unprocessable_entity
  end

  test 'should destroy user and associated posts' do
    assert_difference('User.count', -1) do
      assert_difference('Post.count', -1) do
        delete user_url(@user), as: :json
      end
    end

    assert_response :no_content
  end
end
