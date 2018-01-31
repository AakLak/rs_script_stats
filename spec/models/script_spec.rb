require 'rails_helper'

RSpec.describe Script, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:skill) }
  it { should validate_presence_of(:bot_for) }
  it { should validate_presence_of(:game_for) }

  it { should belong_to(:user) }
end
