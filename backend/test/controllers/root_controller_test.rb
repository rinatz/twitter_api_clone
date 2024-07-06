# frozen_string_literal: true

require 'test_helper'

class RootControllerTest < ActionDispatch::IntegrationTest
  test 'バージョンが取得できること' do
    get root_url, as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_includes json_response, 'apiVersion'
  end
end
