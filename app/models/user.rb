class User < ActiveRecord::Base
  has_many :scripts
  has_many :commits
  has_many :used_scripts, through: :commits, source: :script
<<<<<<< HEAD
=======
  #has_many :script_users, through: :scripts
  has_many :stats, through: :commits
>>>>>>> 88201edc65ba05e245a3b5a8306fbf37e12b9224
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          #,:confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
end
