require 'byebug'

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render :show
  end

  def update
    @user = User.find(params[:id])
    if @user.update(process_params)
      byebug
      render :show
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, skills: [:id, :name])
    #TODO: Repeat for other tags
  end

  def process_params
    processed_params = user_params
    processed_params["skills"].map! do |hash|
      Skill.find(hash["id"]) # TODO: find_or_create
    end
    # TODO: Repeat for other tags

    processed_params
  end
end
