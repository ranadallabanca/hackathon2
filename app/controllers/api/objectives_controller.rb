class Api::ObjectivesController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_hackathon
  before_action :set_objective, only: [:show, :update, :destroy]

  def index
    # binding.pry
    render json: @hackathon.objectives
  end

  def show
    render json: @objective
  end

  def create
    objective = @hackathon.objectives.new(objective_params)
     if objective.save
      render json: objective
     else
      render json: {errors: objective.errors}, status: 422
     end
  end

  def update
    @objective.update(objective_params)
    render json: @objective
  end

  def destroy
    @objective.destroy
    render json: @objective
  end

  private 

  def set_objective 
    @objective = @hackathon.objectives.find(params[:id])
  end

  def objective_params
    params.require(:objective).permit(:name, :points, :bonus)
  end

  def set_hackathon
    # @hackathon = current_user.hackathons.find(params[:hackathon_id])
    @hackathon = current_user.hackathons.find(params[:hackathon_id])
  end
end
