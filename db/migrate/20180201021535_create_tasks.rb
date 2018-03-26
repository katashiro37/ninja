class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :start
      t.date :deadline
      t.boolean :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
