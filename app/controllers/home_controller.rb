class HomeController < ApplicationController
  helper_method :humanize

  def index
    @top_5_scripts = Script.all.sort_by(&:runtime).first(5)
    @top_5_stats = Stat.group(:task).sum(:amount).sort.first(5)
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
