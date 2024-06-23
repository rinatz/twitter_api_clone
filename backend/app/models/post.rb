# frozen_string_literal: true

# Post はユーザーの投稿を表すデータモデルです。
class Post < ApplicationRecord
  belongs_to :user
end
