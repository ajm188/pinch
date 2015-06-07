class SkillsController < ApplicationController
  def index
    @skills = User.find(params[:])
    render :index
  end
  def create
    @skill = User.new(skill_params)
    if @skill.save
      render json: @skill
    else
      render json: @skill.errors.full_messages, status: :unprocessable_entity
    end
  end
end
