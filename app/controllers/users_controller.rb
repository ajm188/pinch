class UsersController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    render :show
  end

  def update
    @user = User.find(params[:user_id])
    if @user.update(process_params)
      @user.professions = [] if process_params["professions"].nil?
      @user.skills = [] if process_params["skills"].nil?
      @user.interests = [] if process_params["interests"].nil?
      @user.save
      render :show
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :allow_contact,
      skills: [:id, :name], interests: [:id, :name], professions: [:id, :name])
  end

  def process_params
    return @processed_params if @processed_params

    @processed_params = user_params
    (@processed_params["professions"] || []).map! do |hash|
      Profession.where(name: hash["name"]).first_or_create
    end
    (@processed_params["interests"] || []).map! do |hash|
      Interest.where(name: hash["name"]).first_or_create
    end
    (@processed_params["skills"] || []).map! do |hash|
      Skill.where(name: hash["name"]).first_or_create
    end

    @processed_params
  end
end
