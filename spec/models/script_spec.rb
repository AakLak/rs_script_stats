require 'rails_helper'

RSpec.describe Script, type: :model do
  it { should belong_to(:user) }
  it { should have_many(:commits) }
  it { should have_many(:stats) }
  it { should have_many(:script_users) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:skill) }
  it { should validate_presence_of(:bot_for) }
  it { should validate_presence_of(:game_for) }

  describe ".runtime" do
    it 'returns script runtime' do
      userID_1 = User.create!(
        email: 'u1@u1.com',
        password: 'useruser',
        password_confirmation: 'useruser',
      )

      script1 = Script.create!(
        name: 'YWoodcutter',
        skill: 'Woodcutting',
        bot_for: 'TRiBot',
        game_for: 'Oldschool Runescape 07',
        user_id: userID_1.id
      )
      Commit.create!(
        runtime: 60,
        user_id: userID_1.id,
        script_id: script1.id,
        created_at: DateTime.parse(Time.now.to_s)
      )
      Stat.create!(
        task: 'Dummy Task',
        amount: 1,
        commit_id: 1
      )

      expect(script1.runtime).to eq 60.0
    end
  end
end
