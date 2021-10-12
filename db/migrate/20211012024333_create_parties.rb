class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :title
      t.time :start_time
      t.string :date
      t.integer :duration
      t.integer :movie_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
