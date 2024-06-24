# frozen_string_literal: true

require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @friend = users(:two)
  end

  test '友だち一覧が取得できること' do
    get user_friendships_url(@user), as: :json
    assert_response :success
  end

  test '友だちを追加できること' do
    assert_difference('Friendship.count') do
      post user_friendships_url(@user), params: { friendship: { friend_id: @friend.id } }, as: :json
    end

    assert_response :created
  end

  test '友だちを削除できること' do
    Friendship.create(user: @user, friend: @friend)

    assert_difference('Friendship.count', -1) do
      delete user_friendships_url(@user), params: { friendship: { friend_id: @friend.id } }, as: :json
    end

    assert_response :no_content
  end
end
