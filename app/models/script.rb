class Script < ApplicationRecord
  belongs_to :user
  has_many :commits
  has_many :script_users, through: :commits, source: :user
end
