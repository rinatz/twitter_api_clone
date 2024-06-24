# frozen_string_literal: true

# User はユーザーのデータモデルです。
class User < ApplicationRecord
  validates_uniqueness_of :name

  has_many :posts, dependent: :destroy

  # ユーザーがフォローしている他のユーザー
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend

  # ユーザーをフォローしている他のユーザー
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user
end
