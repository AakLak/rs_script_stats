class CreateScripts < ActiveRecord::Migration[5.1]
  def change
    create_table :scripts do |t|
      t.string :name
      t.string :skill
      t.string :bot_for
      t.string :game_for

      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
