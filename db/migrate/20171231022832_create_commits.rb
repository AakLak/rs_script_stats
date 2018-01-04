class CreateCommits < ActiveRecord::Migration[5.1]
  def change
    create_table :commits do |t|
      t.belongs_to :script, index: true, optional: true
      t.string :task
      t.integer :runtime
      t.timestamps
    end
  end
end
