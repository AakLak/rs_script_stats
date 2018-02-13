class User < ActiveRecord::Base
  has_many :scripts
  has_many :commits
  has_many :used_scripts, through: :commits, source: :script
  has_many :stats, through: :commits
  #has_many :script_users, through: :scripts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
