class StatsController < ApplicationController
  before_action :set_stat, only: [:show, :update, :destroy]

  # GET /stats
  def index
    @stats = Stat.all

    render json: @stats
  end

  # GET /stats/1
  def show
    render json: @stat
  end

  # POST /stats
  def create
    @stat = Stat.new(stat_params)

    if @stat.save
      render json: @stat, status: :created, location: @stat
    else
      render json: @stat.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stats/1
  def update
    if @stat.update(stat_params)
      render json: @stat
    else
      render json: @stat.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stats/1
  def destroy
    @stat.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stat
      @stat = Stat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def stat_params
      params.require(:stat).permit(:task, :amount, :commit_id)
    end
end
