class User < ActiveRecord::Base
  has_many :scripts
  has_many :commits
  has_many :used_scripts, through: :commits, source: :script
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          #,:confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
