class CreateCommits < ActiveRecord::Migration[5.1]
  def change
    create_table :commits do |t|
      t.belongs_to :script, foreign_key: true, index: true
      t.belongs_to :user, foreign_key: true, index: true
      t.integer :runtime
      t.timestamps
    end
  end
end
