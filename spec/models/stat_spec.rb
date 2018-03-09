require 'rails_helper'

RSpec.describe Stat, type: :model do
  it { should belong_to(:commit) }
end
