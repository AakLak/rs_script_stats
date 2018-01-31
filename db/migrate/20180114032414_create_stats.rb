class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.string :task
      t.float :amount
      t.belongs_to :commit, foreign_key: true, index: true

      t.timestamps
    end
  end
end
