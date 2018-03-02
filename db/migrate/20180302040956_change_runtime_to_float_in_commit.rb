class ChangeRuntimeToFloatInCommit < ActiveRecord::Migration[5.1]
  def change
    change_column :commits, :runtime, :float
  end
end
