# frozen_string_literal: true

# User はユーザーのデータモデルです。
class User < ApplicationRecord
  validates_uniqueness_of :name
  has_many :posts, dependent: :destroy
end
