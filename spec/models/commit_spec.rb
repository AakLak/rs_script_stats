require 'rails_helper'

RSpec.describe Commit, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:script) }
  it { should have_many(:stats) }
  it { should accept_nested_attributes_for(:stats) }
end
