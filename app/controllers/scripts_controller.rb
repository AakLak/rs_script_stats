class ScriptsController < ApplicationController
  helper_method :humanize

  def index
    @scripts = Script.order(:created_at).page params[:page]
  end

  def show
    @script = Script.find(params[:id])
    @commits = @script.commits
    @ordered_commits = @commits.group(:id).order('created_at DESC').page(params[:page])
    @stats = @script.stats.group(:task)
    @stats_sum = @stats.sum(:amount)
  end

  def new
    if current_user
      @script = current_user.scripts.build
    else
      redirect_to root_path, notice: 'You must be logged in to do this'
    end
  end
  # @script = Script.new(script_params.merge(user_id: current_user.id))

  def create
    if current_user
      @script = current_user.scripts.build(script_params)
      if @script.save!
        redirect_to @script, notice: 'Script Added!'
      else
        render 'new', notice: 'Error Adding Script'
      end
    else
      redirect_to root_path, notice: 'You must be logged in to do this'
    end
  end

  def humanize(mins)
    [[60, :minutes], [24, :hours], [1000, :days]].each_with_object([]) do |(count, name), s|
      if mins > 0
        mins, n = mins.divmod(count)
        s.unshift "#{n.to_i} #{name}"
      end
    end.join(' ')
  end

  private

  def script_params
    params.require(:script).permit(:name, :skill, :bot_for, :game_for, :user_id)
  end
end
