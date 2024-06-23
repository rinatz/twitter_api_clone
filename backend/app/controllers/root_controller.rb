# frozen_string_literal: true

# RootController はルートパスのコントローラーです。
class RootController < ApplicationController
  # GET /users
  def index
    render json: {
      apiVersion: '0.0.1'
    }
  end
end
