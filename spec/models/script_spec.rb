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

  let!(:user1) do
    User.create!(
      email: 'ueferfrfrf@u1.com',
      password: 'useruser',
      password_confirmation: 'useruser'
    )
  end

  let!(:script1) do
    Script.create!(
      name: 'YWoodcutter',
      skill: 'Woodcutting',
      bot_for: 'TRiBot',
      game_for: 'Oldschool Runescape 07',
      user_id: user1.id
    )
  end

  let!(:commit1) do
    Commit.create!(
      runtime: 60,
      user_id: user1.id,
      script_id: script1.id,
      created_at: DateTime.parse(Time.now.to_s)
    )
  end

  let!(:script1_commit2) do
    Commit.create!(
      runtime: 60,
      user_id: user1.id,
      script_id: script1.id,
      created_at: DateTime.parse(Time.now.to_s)
    )
  end

  let!(:script2) do
      Script.create!(
        name: 'YFisher',
        skill: 'Fishing',
        bot_for: 'TRiBot',
        game_for: 'Oldschool Runescape 07',
        user_id: user1.id
    )
  end

  let!(:commit2) do
    Commit.create!(
      runtime: 30,
      user_id: user1.id,
      script_id: script2.id,
      created_at: DateTime.parse(Time.now.to_s)
    )
  end

  # describe "Script.runtime" do
  #   it 'returns script runtime' do
  #     expect(script1.runtime).to eq 60.0
  #   end
  # end

  describe "top_5_runtime method" do
    it 'returns correctly orders scripts' do
      expect(Script.top_5_runtime).to start_with(script1).and end_with(script2)
    end
  end

  describe "runtime method" do
    it 'returns correct script total runtime' do
      Script.first.runtime.should eq(120)
    end
  end

end
