# frozen_string_literal: true

# FriendshipsController は友だちのコントローラーです。
class FriendshipsController < ApplicationController
  before_action :set_user
  before_action :set_friendship, only: %i[destroy]

  # GET /users/:id/friendships
  def index
    render json: @user.friends
  end

  # POST /users/:id/friendships
  def create
    @friendship = @user.friendships.build(friend_id: friendship_params[:friend_id])
    Rails.logger.debug "Friendship: #{@friendship.inspect}"

    if @friendship.save
      render json: @friendship, status: :created, location: user_friendship_url(@user, @friendship)
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id/friendships
  def destroy
    @friendship.destroy!
    head :no_content
  end

  private

  def set_user
    @user = User.find_by(id: params[:user_id])

    return if @user

    render json: { error: 'User not found' }, status: :not_found
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_friendship
    @friendship = @user.friendships.find_by(friend_id: friendship_params[:friend_id])

    return if @friendship

    render json: { error: 'Friendships not found' }, status: :not_found
  end

  # Only allow a list of trusted parameters through.
  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
