class Commit < ApplicationRecord
  belongs_to :script
  belongs_to :user
  has_many :stats

  accepts_nested_attributes_for :stats
end
