class HomeController < ApplicationController
  helper_method :humanize

  def index
    @top_5_runtime = Script.top_5_runtime
    @top_5_stats = Stat.top_5
  end

  def humanize(mins)
    [[60, :minutes], [24, :hours], [1000, :days]].each_with_object([]) do |(count, name), s|
      if mins > 0
        mins, n = mins.divmod(count)
        s.unshift "#{n.to_i} #{name}"
      end
    end.join(' ')
  end
end
