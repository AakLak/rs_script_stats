class Commit < ApplicationRecord
  belongs_to :script
  belongs_to :user
  has_many :stats
  # default_scope { order(created_at: :desc) }
  accepts_nested_attributes_for :stats
end
