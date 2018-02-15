class Script < ApplicationRecord
  belongs_to :user
  has_many :commits
  has_many :script_users, -> { distinct }, through: :commits, source: :user

  validates_presence_of :name
  validates_presence_of :user
  validates_presence_of :skill
  validates_presence_of :game_for
  validates_presence_of :bot_for
end
