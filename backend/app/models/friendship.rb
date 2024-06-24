# frozen_string_literal: true

# Friendship は友だちのデータモデルです。
class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
end
