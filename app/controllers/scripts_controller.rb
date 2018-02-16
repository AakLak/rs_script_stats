class ScriptsController < ApplicationController
  helper_method :humanize

  def index
    @scripts = Script.order(:created_at).page params[:page]
  end

  def show
    @script = Script.find(params[:id])
    @commits = @script.commits.page(params[:page])
    @stats = @script.stats.group(:task)
    @stats_sum = @stats.sum(:amount)
  end

  def humanize mins
    [[60, :minutes], [24, :hours], [1000, :days]].inject([]){ |s, (count, name)|
      if mins > 0
        mins, n = mins.divmod(count)
        s.unshift "#{n.to_i} #{name}"
      end
      s
    }.join(' ')
  end

end
