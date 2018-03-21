class Stat < ApplicationRecord
  belongs_to :commit

  def self.top_5
    group(:task).sum(:amount).sort_by { |_k, v| v }.reverse.first(5)
  end
end
