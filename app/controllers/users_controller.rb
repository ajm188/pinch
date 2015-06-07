class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    render :show
  end

  def update
    @user = User.find(params[:id])
    if @user.update(process_params)
      render :show
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
      skills: [:id, :name], interests: [:id, :name], professions: [:id, :name])
  end

  def process_params
    processed_params = user_params
    (processed_params["professions"] || []).map! do |hash|
      Profession.where(name: hash["name"]).first_or_create
    end
    (processed_params["interests"] || []).map! do |hash|
      Interest.where(name: hash["name"]).first_or_create
    end
    (processed_params["skills"] || []).map! do |hash|
      Skill.where(name: hash["name"]).first_or_create
    end

    processed_params
  end
end
